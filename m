Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337090;
	b=Jhq+0xBlX/xt7+tmywizo0x7yZ+ZRLY7KYQAWWUajCbhCMFJrJh/qXeeMPs4joZVYm3u
	 8pyd0pfcGbO2WyRaL41P6JCZqsb5KpZc5TeblMHVDUoY9gpOapnhV9IU8yOxgIV3Yfn11
	 HVa5J0tVJQOjZmzBZJL6jW2PZe7lUEFq6sDC0Xmitb7R5DrLFQ4eQrcH6ZYeTB/fc/ikj
	 iaLZoci6lvfbG42QHg9Vu/XwmMpiwPcRY+I5d0r9YVlej5gw5uXrsle1m2WNT7wz3NDDv
	 Jn3HzNAi58ppYUhQnUHjsYR3VoZetVMVyKN9Y2za4M4L1DcECZZFP3FcwL9JOjF6bHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
	b=C3GUqJKYx+NVCIIeVvRTjz52qnZPsiBCUIIYy0QcN75eRtUexd1K8Q1EnSN6fG6IR0Pp
	 R5T/LRr8vKJr//JNXboFI9C8V09lgfz7LSFnZxK3KFeBe4rOF37DH4vRXDTDNW6rJ5O9N
	 GLtMjRFt3P5w4RXu7LHD2aruorcZoipqRRbLTR1mfSpakf9rZ/8WETRDfWux0XB+BkgxU
	 UQoxVJz914FqrcVTg+XQi51zqNXLJUQyeAU9BmNkiOCOk9lStUHIo8thf7vLEOgdT3fT3
	 8Dns84HtdXl+SbbLuibXxh59qKwecx9zlOT6eEvvbe/7GBOhwv8CA6TmhDimUaG/hEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7760A2609
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 18:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC7760A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hC8j81W4
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e64d52949so207652785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337089; x=1794941889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=hC8j81W4XVy6GM6NSCd0k/bnKZL9dDfHbCnjIHZEMV4YCCxJo+rbG8Q2gJ1ziBpLGq
         b/WGl7uM+GbW0ScCbcGRV81gVeRTeNgz0MizF5kMHCM5ZPPdbitL1rbaLNattI6y9fcm
         0DpQSnY4WXKFOr6Wn7dT2dmcAELqKsJEKzR++vApSbK2g+bqtAQ3mQs5BCzW7QtRSntj
         GWWCQkNu74fERR+RfULkWg5huVt0eR7NbF0yCDO4S9QOY3TsdNE17R5IVmsDeMYlMoLP
         36wy31vJ31vDKQ9MKJyqWq+R6e/unEw5WoidBXKtWmZIODw2TxbkPGzvtWf17iNMm5uC
         b7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337089; x=1794941889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uax/a+Cf5PnYF3LAag3fOWDgi1ERLoTCpA7WArwoVB4=;
        b=j6TYb2jxoatPHYnXcSAZtNS/EW+MFcEieoHjCAMi5USuowNO2Ajx9xPjnPyN4nYPFo
         nENKw02ZppTUIlEBj4aNvdw37FmGlkuqnFPpNMvZRM3YcAoaXAxjwrlflq0jxRyXmZwk
         m4EDkWY5YTaH4HydI7gc+xzP2nrpo3A9sktCVCDf5W/0vQCu8hqAdvCAszmUlZhJSe2+
         0gKFblwu5XG1+AUl6v8R7jnUUJ6aT+lqic1Y0WD6EuQqnwiqiRjhMZ51VSs+Ik8sZxPd
         10zjzcmtaUiXX9lNWEtShNyynfghPbVYp5MPdHhZy6okXmwcVF94to7F7Q7i67yWzaR9
         TiUg==
X-Forwarded-Encrypted: i=1; AL+hErHD/dTbb8q/LIvH8yvDTYbXpYZwGiWg9n3EKezJACms9nT9iS3CY+BK7lnzF43pxKq9dc4R5S5qPYG7JJPb@vger.kernel.org
X-Gm-Message-State: APuU4Z/gYoFUVL1Apdoo0ilZDOehfnGEp/ota9OIRcSnAVuv07thS7t+
	bG2j9F7CX1ncq9swzdJKxwyKhYdZOus73BdQ4qmfSs5XBYodB/q/cnbo
X-Gm-Gg: AYBFou3sG0g05bBxX+Tr+/yFLzvBC5TVinSiUMekIUAjq2aiEsX1zH5JFBKBu5jyJsd
	abvViXZuqMiyAsgtEOe8bmy9psBQIXFWmlXzbDw4i4QPwUV+0G782kEk297n/su2F32y7QPSWAf
	VcE89ltNxT9iy9SCZkejlPlBtfBggT2HXz7kxl8HNHlcBTStOGE1auV6tCMdjwvuyrxyab0qBYG
	EH8aSOugBZ/+rIE6nTbhwPqaUWfdIIe8WNkJyP60HhP4hmExyxyRzyHDrgqZ2FRvGkU1uxhzRVq
	zG5YYbtDdjT6zpbN6WCJ3jiPoGf3A7suZSRACm4hXtQLOugTNB7TEPdUxkHLTI2Ax5+JCZ81XLz
	dzrxjF8+WgU4YqAE13ZnSl8IoheBtm1uV5IM/EMvhCe5RpZ/D0wzqU0qNeIO7JDeuwihAfGtzRo
	c1UnY2lDnADCRZ9bow4aGsFwd0WPD+IGSgM7CMhBE6ZKCIjbjgthllzr+ZozEqQdM4nb779DP4R
	YWpGQMiFFLVlGGgkaA77vYG2V7gxrOTTOjOxOAXPnKztF1eLMvYhxkB7ZT/twoRLwDMo8iWBLi4
	9vDhaw49+R9BtIRStn32to9v994e95/4sU08MX9/Ea5ziZFR1hRY4RHRLJbi57dqB8W/yVr481h
	/rxCGuIpEEiqfpMQsSG3jiXjQalB/UTiHuFYoZDUHxP5ENemO2NpNkojtXua4dtHDgzOyUDxXFZ
	SpNzifRHhB2FpBuDfoJbK+KZSqSlt615SaeRjxVwN2rr0Pe/JbB8LxGO9xFJazCzK9dJLVV29Lu
	Ck1P2UH0t1T1LT7OUZ++n2eW7UV9MJIhCH9iB8rLN1oBQ==
X-Received: by 2002:a05:620a:4041:b0:93e:c12c:f127 with SMTP id af79cd13be357-9479f38d707mr575616785a.83.1794337089011;
        Tue, 10 Nov 2026 10:58:09 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm290954085a.4.2026.11.10.10.58.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:58:08 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
Date: Tue, 10 Nov 2026 13:58:04 -0500
Message-ID: <20261110185804.56861-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A16 (UX3607OA, X2 Elite), whose mainline DT
connects Bluetooth through the M.2 E connector (W_DISABLE2# on GPIO
116), with the QCC2072 support from [1] on top. Without this patch
hci_qca asks for a "bluetooth" pwrseq target the connector doesn't
provide, W_DISABLE2# stays asserted and reading the version times out
(-110). With it, W_DISABLE2# is released, setup completes and a phone
connects.

[1] https://lore.kernel.org/r/20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
