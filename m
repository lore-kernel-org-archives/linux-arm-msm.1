Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713865;
	b=fVmmoHvfPyyY95QAy3JZmAHSTKBW4mPWPR/pjvhB7WfpW5S+5EqoNU5RP1RYW16zPG9a
	 NeCZy4nUd+ZarbDSlQzBsIO5EI7G8+5Wkpb+qWs8wgFJBEep8OME1Dbj02guLu4EGSjSK
	 vsRCVa8+7Wpze+QLJigqTpKEGL7GDsfT/ZZ2l8Sm/EacXGvwBAI6HfwnWiagypUOUS8XI
	 kedSqPO6k/VF2u9Kd1DI7ZZRuBcmHlydjZyDC9BHciaEwb4RzHq52Yy48OQNPKObGsBPk
	 WpumV+PigYbt4aPV0RaeRDIwjSPexz/yNhhsNN8Wfnmtk5yU1q9oLPSSP3RsEfYc3OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
	b=CLDoU20/JUYNI2n3yuKFFgZ8j5PxWu+as8Ll0ehENvHtCNB9d8Slhv5PMZ/3uofMivOF
	 ggxT4aGOzhgNU7AppGtObFqpBDglvqk2MqYyCx6sxajvKoKbJ5h80nE2WINfsQ6/ITTQh
	 z7A+4CLDX1HIKUd5hYnaN68KWvCyvTo35zl2cWo/p/nAZ7wh2ij8TiqED6cxKt7MRZi8T
	 k4BHbmz8FAe1P19+15jsQYA69i/Pweg54jImKV4xgeGNHlsjDSd5cSxgLJ3crSDRi+fli
	 wi2o65siKuVlT4V/36rG6PKLpzO50PNLp49POt+DTqSnMLBF9txVnvgFOjMbPvRQvxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13246082BE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13246082BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4111222c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713864; x=1794318664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=fADzAqWqD4zUvJ80U2YuUArvszc6Y70kh+DWT3mFXa3hrhEkMQOpubbBpOKwPrn5P7
         DA36qLlzDfzi/UHQ985HwJcY5au+auPiL9oDfjSeo0ewNaraYF+liP9l4jbTAZQ/AsCW
         PTkoauBP3Zaiki9lnphrvAnF6dHWbYWfDF3zhOQfaR+WvbbvdmU9i8hsmnvIb/UhrTRq
         qwTM6KpwmAtK8KRtnB1Psj+EelNSsSPCAzGIFhVz1aG4aEm1qr8AyjEdjGnhR9esjNK5
         zVd0wKhj8Lke7L6v0D0ajWnD5fJZU3h81NP7YDUG+1IRQ4NF7sJi0lWJ+ZSfCe9QxmUV
         2ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713864; x=1794318664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=baRGR3cyWzSV4jYhPoQNZGP599JRLpMxuLeCaaWmhkBt/mMGOYs7foAGylY9FjTDJp
         01tMTD/WGzbcWnGp4RqQjcfHmu10GdEw5LEvfKXBa6cCfG2erdd9TY/anrUrTB+7BbxH
         5mJ/S3oosnaoi1B6ACwJ/0mNqBS/4Tbb5oTAHCqwPxim6fHSJZoCCZTxLw+w5kcCywby
         29z87Ig6T5NuoIrVdvyh4gzvyPUj9LjzbX04w62TYjfC2GC5q+tma5P3hdDSu69JoqZE
         ElhSpleGybFd6pajKrh/pEHp83r3d6lOwDKfJVe1lyLrdgnw5I8QPFKW4oR2GMTGEi08
         rSBg==
X-Forwarded-Encrypted: i=1; AKwUvBzVVvg3yBv+qW9o3yWEGaFdFUejT/QIBZJ+ExzqEhFMVUXoH7noLHKHLO0eiFef0L0FZatJj59OPuRMPw/i@vger.kernel.org
X-Gm-Message-State: APuU4Z/msHps0k+IRECLbI/FxRAmBzUeWfoInl8XJUoF/VpRnKecPnYc
	fxwx8vaIAuKtSirMYPsV+B83HOXXWVT3n/m9DVS9p67cgwm0ERnGNywS
X-Gm-Gg: AYBFou1RKo4DUJh8Dd6CEkjDQzFNXFoLjNKoWnh3DrTATyuxONMb9HNGrLchlGkJxV5
	47l0UuFP2K9RGy8viXmU9TtDSOMyJ6HsMFfslCOrLZ6TNlif/ISCF2wt/VUjwgZ6/TvgZOm3S9C
	H7MVf+Ltv5JjGZPQI5QfW8AIyb0oOFz6xsyn2UKcrparDLhYyYpP9VHPvaTr5WyqpM0i7HEx8iP
	QK+2Ua9PxV7+FyDfKZit8WVY+Hrafo1Vw66cZ5oqDz5wcTt8Y6VELTkhGgONKFLK0lFAvCHT5wo
	j5SUMN/G2bTwmtYlPkvG5+0NM4EfvyJnasAV/qoh51Jvf+mfMcTsENu4CbN4beP2+KytjgVt3LA
	yEDEGR23j765C4Sdcup3ffIyFFyWMLrUtRtcOL2SnLMAI67ccTcex4KzQbCzsYSvMeZ3aEHsqiE
	RK8usrKWR7Ihc73gy4cYpbXpVDKOoa2Cf0i9I7qqNxZLIs0ixhgiKt+9N4sjCb6pIvC4n25Qmbd
	+C2GmMK/mDN7zH6DfFWIPi+qksZgArZW/DSsg6eWczZZIdWL7CM5cydxpfrowIQ/oOU95SWAAdH
	b3WGRaeueEbOzxsUCdJyuiLUF3Si9XsUoOl87TiS04we
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b23b5bb847mr4423650c88.8.1793713863810;
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
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
Subject: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 22:50:55 +0900
Message-ID: <20261103135057.1682-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..14fc7e4ebc80 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,8 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch: true
+
   wakeup-source: true
 
 required:
@@ -170,6 +172,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

