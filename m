Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463876;
	b=HVv5F/sUHQcKHUb+shFK1lpkwVZ5Qwv70ng7rMvUmsqHigRYcDQSLG44vBXa/+NNwLJu
	 x2xOh1b9jru1oP7+0wF5bUUHGBn73WKf1yUKC5niUGiTB2tORsj/OmssjA8pFTxKPidrO
	 1sbJ4QL7n+K2uo6RS91o03qQ+5CeDO2WgGYx3RV+dTQ9zfPOZa+3YFYDdvZIHsWgjUXYl
	 4CCcYw1NuowKaWqcLVhAnKqHsQ3vWj0iqs7peBBhNOTzq1FwI5dHpkEokf0tLYDGLYk+9
	 K0xJmy/1P3PzBqeTfx0lltDLUX2QX8WH6muWX9JDUadH0HD0olL6hjrTjkKCP4tXfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
	b=CW4SrPsIBvF/qm9GU38NGO+iU9xllitzCIy5LhQQhSJmSyh8QEdYtgpFewe/SdxBTU6T
	 r9YcBhO7ZhFBhJpvVClJ1Er8Zx3Nb1nNM8wSSfjLLjhnN3twb5OunGPr6ANwgMH3z64JY
	 066rep5DA8oWlTbjqPPdK94IRjxyFODxaTtnkP0NlNH9XnhY5U6UlH4orYOJIkqYkIHHV
	 GVRNF8yy3E4X+i5wSVuPFvl2UHrOS5jayvjnEwo18KqYbZIWZ/8DQHAJ3WcwUK9wcwl6o
	 dC8eLjdeTQU2o3XkmeSH4Hkp91EY8HjkvTj60uKKBl0J6hg7qrRnCgFXmIht5m3UuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF3606A33A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EF3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93a40a9a01aso345043585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463875; x=1794068675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=lGqGKHJzDGXW17jD1pryPBA87LDIwWyOzi8ssjyyiVNdhFFuW5BBmlnYMDlxTFxKTt
         PI7yyIZlXQ2rk3UiSv2OD0mL2nqff5KNMDWzhASTkZtDlOVR0qbZ75V/EvbO0d7VhEeR
         LuDxSX84IBSJYV7vwANkLCkq5ODi5x1RypITAppVUuEhdPormTQR+OqrF5fIKaebEseV
         4zGWOGDG0wiOz7ZwvEYqWs9h6r6vNXPiSWW3by6mIzIUA9xOOxKIp7yYXOjl+teB3K85
         1sZovvR5gYzTsezBib9nOY7Ie0npgraHz0HAAThVt9wRL7/++PwiEluIX4vXC07q7tSS
         LUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463875; x=1794068675;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=XKEjhLnNqC8lpDFNeBJNPheNoj2FctLcLlkDa2ygpltCu3eCdSVNVjIy75/oTxaqHh
         ah92EBczcX5O/PZ5fb1CNTf7KzWQYw4g0QIYIuFVHeMjiCFO8tHIR7l7SOKYm5p+fEGI
         YuhlYHJCS3HwjFI887q6gyKWBAVl9Muz3etQkEPZk4J45PLYDlJmmuqIUvjO1EJTRIG9
         jlPM2nADCCgAh8nGVs8Uo9q0LHlKo3bRoM62oYAujycwkzIVgguNN6yKRiAJqudSKNiB
         LQ4rVQuut9HIIH/bfLtCwWgyiKDbUNUX9Y8Be/1u3u5QcEc8WVCacYNzNCfXOyAaYvtu
         QAog==
X-Gm-Message-State: AFq9FYK5XCrszHtO8oUF6PPsFuWCJCCq1kAEHloou5g3Cr6/12vRD93y
	reo5AWdTYL4EEk5LQVhIqaO/oJabkiAs2vm6nQmZuRuxEoUbpKtb0ELN
X-Gm-Gg: AYBFou2edK+6iiEKzfgWkcjd0Covdw+RT8ohggjaGnq6BbLY2k0d+wPo4JZZz9RyGSY
	HOz2VSYWJy0hnb4QY0VftUIyOwvTNo0jZWNgyqEOYvdJQgOcVXIY5R4zXpA6s23yIqMj/Rl73In
	jUmvFLnpVJNb8b3NaV1nY4m54E+pdwiwV5ywtnPc4dFV9ka7JimSYb8x+UgimE9dF1rhpLTHetx
	va+DiePa0iFHuQrJDQNI+/RdQoUK5HVAY1hnAOTB99dcDKaerPwgWsD+qvgEYXEqMlhSVnbXtYG
	j/y1UblQhu9sern/eQmidMgQGQC1HpAGyvNPAC3KwFHSX2nOzNL8lCGyHbcpPjNalPp81u4LbMp
	rDdYLrVC899j3HGtrxhKakRZMM20qXbBjqnSmrhQeNl+NdVEbpiTLfIuhwJSvIwKptNwqmXDg/I
	Isl5StIGmXcM+GyX+4uopbpsfyIPXZF2cVJbvO/URoUaey3imtpYHQubHmNRz8CS/wRiS5wjjw/
	4KRDZ+xcvD/iTgaxC9kZYSeThJQvwXcqFEc3h374642+PIlhjPJ/Pe3iNMGG3w2ig1nfZxfq/yW
	9xnwkPSCfsTAWIkn1g+zZciw/QMuOJmuP/pbdpO6mdF2ABY80Y0hVGsVcGhUf9AvE67BfNLvrL0
	QRqM5xg==
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr1377062085a.26.1793463875288;
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414076885a.40.2026.10.31.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>,
	Burke Cates <burke.cates@gmail.com>
Subject: Re: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 31 Oct 2026 11:24:34 -0500
Message-ID: <179346368316.44447.5094215662368347048.x2e-share-pm8010@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

PM8010 at 0x08 on i2c5, no interrupt in DT: it probes, and its
LDO4 and LDO7 power the front camera (ov02c10, 720p at 30 fps).
