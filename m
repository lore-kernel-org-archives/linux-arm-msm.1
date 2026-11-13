Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557800;
	b=2Xk4GwjQKxRhjYvopBl4lPptqHAiLTSiqFLuw7t8dQGncwO3GC3C17K2Rm1nkfQ8HPXD
	 YymrbX3u622iws3Ys7R0adnEHA4tnSDQW0J8BtxiZ44G5TFjHx946q9SJbDzUHF0NPAYA
	 l0xJGD7xyn96pPrMMxRY8q3bzy1ET7VPyV9+IzoGglsO1VEvCy4sVfK+tXb8MU5u9Ssbz
	 S9z8XguRIBnqQK3YEgV3TUEZne609hoeG5saWOn4EdqhoQvyqyn5DFZaRmao25+ZcPja6
	 23WUit6LADrZhohkwbbOHOUV9U+dWQ+DV8BykO4H461W129NJmCwCGRruvir62JalDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
	b=LS/OFKXhbmBPD4k0jH9L0QJWRy2NHfHWvmdXeE2NUEA0SZNDM5Va7nVCvmv6/OQwv9g1
	 eX+dWKy9Xn3xAgElZRCQXMedH/r3+r9Z+GGtL19TqmnW4mm8GHo6DWjDQ6XYXpP7xu2Il
	 PXp5l/Bty0HEQjor0vp3nlBEyMP1s1nLJTKeUgf5UDCvGrlRsXHTo3t+VcMvNMqMx7jLl
	 2iBYj/AOwjGKTOZVo5g7i5Cf2d3S/pUeaI6+HDp3luSZs9OSUsjut/bfTbd2JvRpYFjTi
	 blgzgJd9gHU2ff9mReGRPISTFs5wBMb1btd3jyL2Ocjsv2Ct7POu1IQ3d/2d6p12Wmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=HgXDDgyG;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E92606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E92606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=HgXDDgyG
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d581da0aaso99653366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
        b=HgXDDgyGC3CbfiULiOuPU0RqFlCCS/gLIr6FY7mkqgqaXSGIJ/tfJg/b7Nxv/zIRJo
         c2ji9yU6Nc5lce7Ut6mOubwmFSj2pcmyBI27rf4pmxr6A+jBO3zCX5Y3Zav51YXwMx8Q
         XBMMgOusmIMq8izF2GUBPKrchdZG/saGxxq9q3n/7B4ffTX4FVExj71TwY5+37aJWGGX
         Yb6LUEH0TBSQ7WQd3lyH1N7MVbGKUo3OEAFv0xi7hafJVFmi+JFuDHqBnIksSOApC0Wr
         mCi1H9upFfdf0bblYaDRfcKVUy8n9uCkfcGLeBpwJ4JEtyjKhMCPu4dDLbOYcVLOk6Cp
         uH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
        b=aPZrUCzr8MQXylhxTqvLT+Q4peaKN93DTZljh+UhqHJlqCjpFjIdBQa2a9gwfVXmMd
         Z9hLcG5yit//zfFBykSH8da25+rjShuZqcyPQDz6AK0DT1dCr7bNoos0+ENqTqMe6IG/
         oYE7MsHr1ToI9/ll5Uyvrg65EdtjtC6Q2/LeIbAUO+zn25F2sEYmiLt5X40poO61tT/J
         dLE4L1O0ZK8revt9nXVMBuSgNih4fDXO+U5dArCz3xJXNvO5X6ZR6cC5Lol6zJ8JCCs5
         6dPSPhjU+0Ph0DnL63WbNeZISz+IqYtvS06JxfirGgjl7hTD7fWK60WY+Txp+hw5wDiD
         8I2Q==
X-Forwarded-Encrypted: i=1; AL+hErF5AjTBsJKTaDr9hP2VZubShmkIlcM/0YtTkfQ3/YX9XVAHynUT4DKVl9kRMc2VViVeQGLAlFMVyOt1++mm@vger.kernel.org
X-Gm-Message-State: APuU4Z8C3vRewPHTwVtgKF7R34V9dHe/xsyBBtmO31+c6mHGhCfbhL1P
	mwDkgmIEJBOL5uKmMnPJ1TkX5+G9L+bSxZX1+OHnZD0vMIWEcrc6dYekh1xQiBlMSLI=
X-Gm-Gg: AYBFou1uOBSeLkFIFbA0l2HSoUqob4yMxR2xIp9DYQymuz2OMD3H/Z2tx4FCQnkyNSG
	CL8ex/K/Mqkqf1Cf73YnMRqOO8vMmDAwhrHKzpUTRw8RxzUuwwr3h2/h8VKbgz7Ghkw8RWe++4A
	cedhadM7iOsp9+1E4ccRtjazJNpAiIalHiUKVojLpFrXXNqTCLYPJT20NHLNxDOOPZpDuqZNQml
	n27fs7lJqUyYohSKS8rLGSruHvlXOm8iSoWpOK36qqAvd7/5fJxpUDeFXsuxf3VPiv2ZWAtEIbA
	+Q9dxg7kpkg7jvyRBINBgBUmCh+BK3COAiH+annDDzAE3Bfz5OQHEdPHfiOVuvt02XIJxVs5En3
	NDC88tjPcSCq3GxGIqoTWo4shPZ72x7P9i8SnEDqwzGUHxVwWtTAmMG6cyQeeITnLFlSwIdxzLx
	FwTVTEJUFU0oVFIZsYDjFNAulZoCf2pWZB6fXRUOupuRc7VcBWwyXGvifSxjOpeKOss/N/eVkUU
	oiky72BEgOZa4lxaFtp2AyCyKVF6ejjzCrl9n7EQCFgoSOVhx7Obu0Iw8zBvbbzZvxGAwR46Tem
	9BfaJKiBOxKSHcYeg9jEkjp9dxac+fDEsoKXBZoq+NdZQigFRCNtxTuUV0vxycSWgq6vBUoWutV
	awC7LR2g=
X-Received: by 2002:a17:906:9fd0:b0:c42:102f:15df with SMTP id a640c23a62f3a-c5096346e89mr133898666b.8.1794557797957;
        Fri, 13 Nov 2026 00:16:37 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:37 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Wire up LCDB regulator on Fairphone 3 & Fairphone 4
Date: Fri, 13 Nov 2026 09:16:34 +0100
Message-Id: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02PQW7DIBBFr4JYdyIP2NRGVdV7VFkAnrY0gF0gV
 qood69jZ9Hlk/7/b+bKC2VPhWt25ZkWX/yUVsAnxt2XSZ8EflyZi0YoRJQQ3GiBkrGBIqUKyip
 6bmVvBzHwtTVn+vCXbfH9uHM5229y9T7zSGT6Oa+qusd4pFLMptLsZTc1gxDYdvKgul6iAoTFh
 LfZuBPVenDTFF75/xs123oNtlBij10Doy9zML/gTB6BWknU2aZ3CvUi7lVrCoGbYvRVs0SXCo8
 fBT/ebn955r9HGQEAAA==
X-Change-ID: 20261113-lcdb-enablement-6b6e7438b929
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=2210;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZtGX8N9MTzVFwe7Y01QGBCSDH0pFtGps76E3FzM9X84=;
 b=NLb2RlhXIJXbUXS+lt2QrOjap3pkmIn6+VG7gBNj3PB2KW82jhdRUl5WQ2hdKyuN4oJM38ZSu
 sOl/tLZNusiBjXov+zTiLlbTob8w0tbb6TFZhmeDghRHV+YsU+56feb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Thanks to Dmitry Baryshkov for upstreaming the LCDB driver, let's start
replacing the dummy regulator-fixed in Fairphone 3 and Fairphone 4 dts
files.

On top of linux-next this series depends on these two patches:

  dt-bindings: mfd: qcom,spmi-pmic: add LCDB
  arm64: dts: qcom: pmi632: Add LCDB regulator node

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      arm64: defconfig: Enable Qualcomm LCDB regulator
      arm64: dts: qcom: sdm632-fairphone-fp3: Wire up PMI632 LCDB
      arm64: dts: qcom: pm6150l: add LCDB regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Wire up PM6150L LCDB

 arch/arm64/boot/dts/qcom/pm6150l.dtsi             | 14 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 26 ++++++++++++++---------
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 arch/arm64/configs/defconfig                      |  1 +
 4 files changed, 47 insertions(+), 20 deletions(-)
---
base-commit: 161837d37055642b03475137461d4438c65dbddf
change-id: 20261113-lcdb-enablement-6b6e7438b929
prerequisite-message-id: <20261109221453.658316-1-val@packett.cool>
prerequisite-patch-id: 84d9aa24bd2b6f02ff8ca2ee6c06aa15820a239d
prerequisite-patch-id: 83283c2786561b5b60886150044cd3c31c9ee9ee
prerequisite-patch-id: 44735c66f6ee898028d303e7c52199c6e9bf805d
prerequisite-patch-id: 465273bdb21128b91fa70ecccb67a46ad8b92e2d
prerequisite-patch-id: 87e1ba7499655a72820b61fd0a61e9b64a28d678
prerequisite-patch-id: 7a38824c3aedab41d9c2e8af53fd2ac6c5240467
prerequisite-change-id: 20261014-sm8150-display-card-e43ee5b08c61:v2
prerequisite-patch-id: 9c929d1d906b763951d1dbb6982d08a464fb27a8
prerequisite-patch-id: eb2335be5ef8557f58b829ae86bcd44ce4f942fb
prerequisite-patch-id: 2fb5cb31e9527f530afc1199450f4399cc9d696a
prerequisite-patch-id: 6604ef4253eeb0a71e69cc275f686d8acae95e36
prerequisite-patch-id: cda0e5a03ff6db8e7c05625c5aa2b8d0cb55923f
prerequisite-patch-id: af1e08086776ad9975fbe76d554d0176bd4ba70b
prerequisite-patch-id: eda808edb82735d47769c147ceaf21946f801a0e
prerequisite-patch-id: a3272820b7a6fb943a06f267566afe1ae97a56cf

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

