
(in-package :parse-css)

(defclass token ()
  ((string :initarg :string
	   :accessor token-string
	   :type string)
   (line :initarg :line
	 :initform 0
	 :accessor token-line
	 :type fixnum)
   (character :initarg :character
	      :initform 0
	      :accessor token-character
	      :type fixnum)))

(defclass parser-token (token)
  ((start :initarg :start
	  :accessor token-start
	  :type fixnum)))

(defclass parser ()
  ((input :initarg :stream
	   :reader parser-input
	   :type stream)
   (input-line :initarg :input-line
	       :initform 0
	       :accessor parser-input-line
	       :type fixnum)
   (input-character :initarg :input-character
		    :initform -1
		    :accessor parser-input-character
		    :type fixnum)
   (eof :initform nil
	:accessor parser-eof)
   (cb :initform (make-character-buffer)
       :accessor parser-cb
       :type array)
   (char-match-start :initform 0
		     :accessor parser-char-match-start
		     :type fixnum)
   (token-stack :initform ()
		:accessor parser-token-stack
		:type list)
   (ib :initform (make-item-buffer)
       :accessor parser-ib
       :type vector)
   (item-match-start :initform 0
		     :accessor parser-item-match-start
		     :type fixnum)
   (item-stack :initform ()
	       :accessor parser-item-stack
	       :type list)))
