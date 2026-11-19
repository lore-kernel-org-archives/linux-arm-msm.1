Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092410;
	b=fS+lc5n7BJ+I6BipjAYX9zJ4fLesOVca8SqVsrlKOLJj6oS6J4uRo6CnJm1M/LpHYY58
	 3i8XOTwAy1a5Ldxez33tOma5W57qY5ahvXrehLEW5wR38TCaObYANORJIKwN4XUQA4kYc
	 sy8q7Zj2Ih4zL2RpnaaSEspJXw+3UONyRTseLZtPn1HXrfadYkeaJXMsmNcU3UNdgdEav
	 oWWduBrWxSC381tgURaQHmD+fsZZ/fU+ZCOAFl83K4uYha5PXvm6e0X9TX1snPvxzkeRY
	 RRdEr8yZ4uYSlDLCuVuBsagtI29vtc9HT38SGOBxnrCtUVPvQF/bqZlE8+KMxx7TKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
	b=GN57Jn3w3PXwvvh/J7iN5n8lUG8HJ3hoJiS9otrSamSgXviDqQSYf1SVLWjftL+5fHbK
	 OstN68DSD2sTWuA7pOZ9Q8MLDD634dd8ijLk9lNPvegtcT3byOo5Q3DXUL1o4muoVvYJ5
	 IeOt2ohJBIIFoqh5l/nLVrGtCtwFspmP0MQBEnaQbj1AYm62vrS8zsmT+Mc/CiBltOHVE
	 uS3HukwmXyz8aUX/ZjvDi9DiVBneaqzXyYXrdTQ/1LBwCR6EycyA0DEYyWk52cXQXF+e7
	 T0EpXvqhjOsyo9DMRIoCQdqLjXuUkiojdkwv5Q7RjbRUfTbxwdvHKayb9eA2I7ia0ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C14606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3630323c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092409; x=1795697209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=BfVexAMXUExPA/yU1/HvoxaKMziAg/iD+IUkHNZoxPYzkEA3j1C6nIt89AbCwkXPRO
         /cce9sydc7DmUaiiD9v7hE9hgI1ZMsnDCrGgTYI/xVDxscovZXfGZjiTvCQC5CBJ4zh1
         rbfUnR6wOGT+8PMH0NHQY24Gy9AVVc4jze/FJc+s66e4NVtUg3Oi5AK3PlvSTRyjacP3
         aOwAfj7uxwj418/tukp5tVVEF/PUTXOL4hycn4H6XyLCVA0Qkw8gmZIih5yFRhBe6V7P
         YH+9n4wqb/IMKYyg+jwFOeRQEXeGZ58RtlgqVICZ99RkGTmlcRt0tbnS8gt7ZXphedba
         4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092409; x=1795697209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=AZUAx7/ECoxBUmkZzYIthDfsi8rjMhXlSbjOHNsI5GJzQ04m/NjtfhYt9/4yaoqR10
         uTPvtoAmv73CSXZXmNO/nUgLhhOQ1qIW1XqA05UV+fvYF4go2hAg5HGGrvl/0t651tzF
         O1DJKOZUeSgQDAglHynbRpWIOr48zc5rug+9q5xbd2Vjs0Z0yj5VtJIu61+OxMkit848
         1g/OAMiKRNpeKjWX0aLryG9OEgnW1jVOa2NXtx0oBvAUVAFOTiRgbkaHNVeJ1GdVzemg
         Iv/5tZzIOa3Ek8aGqTxbpJ7h72YBHnd3rx5gwVLdE3ggN3BTS2eh0xZ1dkTebhVmDI2P
         6Xpg==
X-Forwarded-Encrypted: i=1; AL+hErHvZws2qIHzKHxSDTmopYYR0wYsrxwYtabFlL4xcUM4E4VF9EuR9RjWkQ3mWuI7o2ph/k0S+THr+eijGXnX@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y01+fTaovdD4BVmmeS9j1c+cJpPdwpSEfCCG+R4c+Uc4n+Ojw
	4MN2/KbfUje9sj37RG19WJnfuC//K1/EWjpQTepv/CEQ1mdml6R4jTd6
X-Gm-Gg: AYBFou3L7o6d1N+8tmTRrwIIohUTZg7z7usRSGOaoEXk2VNcrFoYLtd5B9XR7jsS24m
	7n5bMYKCeCo99Zfm4epQ5yCTv1fpXwPT4HjqMMfiHbmSvJzMLWmkYLaiB+C+VRCRBtdHyox+2JS
	aqNXrpdAmqZLQPp7yuc3krJoevJNRp0yMeaoiLCisUfuDJIkWnPTGJhIaSO+GsR5UHhivleWA28
	qmyanMtfTuBRh7FhM3gcALyzIVL3V2kWu+2SH5ggDLww3QYixm3353bXcYgVm0tRNILeGPa7xDo
	kaQGx9k5kZfjqh2p8dvZOotgSEmSci2OCoeZeBVdKQXozHJBEzaKvkog0apjx3TtPi6zoxZhlnO
	GbLjPTDhBh/VHIMn9ZB6bluo+eJxqsRf+x7qyKdLyNbvwXII74TSMSjRrGSBNnYdoYg8hK1bEGu
	EsUMlc2ZcjeFeJiC9gMr33N/UfBLzCwmeLId77BDqy5JABp3Tsy520X8560SBNZf7q0YvFyYblq
	nq2C4JzJfA1giKAn9ZjA8CThsSe47r7KTyvqDE5KyXlqavRHvMVz30dWlE9jzr2Tov52jvktRP1
	Hvp3FMNho/1FK45afqF9w1VIzQbR0s8BT8w=
X-Received: by 2002:a05:7022:7f15:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b543c3d7f0mr4441883c88.1.1795092408616;
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm13868656c88.14.2026.11.19.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:46:47 +0900
Message-ID: <20261119124647.983-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com> <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 06:54:48PM -0800, Peter Chen wrote:
> We did an internal discussion for this use case, we may prefer the solution
> that let the PHY notify the controller this PHY lane is going to change from
> USB to DP (4lane) event, it could keep driver independent with dts for this
> feature.

Thanks, Peter. I kept the mode switch in v4 and explained why in its
cover letter. The Type-C mux framework already calls each mode switch
linked from the connector, and with the usual graph (HS port to the
controller, SS port to the PHY) the controller is called before the PHY
changes lanes, so no new interface between the PHY and the controller is
needed. The cost is a "mode-switch" property on each controller node,
which a notification from the PHY would avoid. If you settle on that,
the clock selection in patch 2 can be driven from it instead.

v4: https://lore.kernel.org/all/20261119124558.1548-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
