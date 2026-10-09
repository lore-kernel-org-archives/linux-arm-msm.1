Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E684DAF8A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551600; cv=none; b=YIElujgURAhRN84oDE67p2BfTBLtrl936yGVXy/lgBwsDU9l1pes40X0SO9RXQBivDWComw/hfkJeKvGwXZVSFzncdE+9+QB0yr0EmUm5c0ZW5ZaIOrhs82FZ07n1omFGxLUAhi+hkT2nmgkxQFdkcJvo7yaw1LMNCRUfAyzGiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551600; c=relaxed/simple;
	bh=dGoqnN6KIe5hbkYTrJjeiwkSgDmk4QM/8FHs0528jZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbFw67Iz3FJ54Eo2teK2eS73qv9sYP4s65UHcE4yy3w9nhi2vsLCXU9Gugz/Edckeyufsdt1+JxnheshalnKE6vXh6bCoplANEkBAuveJabp4JheN1vdkW9mjngwxQcIw4aLk4TNKl6HI3oBEPC/r1VNUc47Ua/Yxa9EOIVU1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfYRKKso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFxMBtKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfYRKKso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFxMBtKm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHmS230929
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=; b=SfYRKKsoq74mk2Je
	lcCfeLC/PpHRiBmCN51Eg2bFhDcabEaoZL010Q/7JyxW1/jTfSueJY01zebTMG8k
	hjiTobLQhh89tp13cf8BR713gH25GJEMpjc8wXCGyLcGONXsedWJ8U2Tz6UPlmx/
	SAlrTu1jUOss/0obCuq3gNlAw08o0FTbyMEaxoAiCtmHCjkk9yZyljpMcOcEvy9n
	Uwzs3q/VqzMbthwtb+THJGIez789F1NaHOgXEoX5Pxf6Q69H68j+lQkqkNJKiKu1
	w4awvv0Cs8wNL5RN+DL/soKDAw3YPLJdhOmHMAo0eM/0zf1dCEK+AsDESia5el7y
	bWphaA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3mh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:13:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so7087754a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551597; x=1792156397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=;
        b=AFxMBtKmyVfVIHL6Ps3LKzak/LA3Fo64L15tqBaTZfKckC/DzKJ0p4NwhoVJeSCtSV
         mGLoHZYdFwNCju2B+3lqvl0RC9ia7XiWjgMD6Oy6Wq27SOC8dmxtIqmZbHjXgrOEuwjO
         sLiwUVaYRWmb6UzvZ6ejT59ZI7foNvd6utB9tCw156FbaJhZpls0YpOlW35WBapCvagU
         gREeG+Eb6h2mqEsL+T4nQjld2bAKd1hZBrAblpHSVIBQE8ZTZQOnm4gXVXx7LRuJjatG
         Squmgjhf6TEiJUzJcXYssCXI3O4bFwK7e+w730ca/gR65lTwY7TPKOroNpz3zKlJPr4Q
         cWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551597; x=1792156397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2vNY8QGJlSgQtrYgDdBjy/KCqIyEqj/mv2W+BUYgD0=;
        b=jNvzxcCL8araRj+9XMNN4ykx5LlW9O69WFD9Kq8LQMbc7hNLALjmZUrklTksJ6lyBN
         8BqIDFJxAoyaid6bW46aXx0rf5SOXKLTBIKIoALi959Wpm056ptIfbSACfoP7Ht1nZ9W
         Raq5foyInkpyhiFqFBeR5e1oef0Y0AKSsc513URN4RM+QM7AWWRtzblbbhKxEeIZhORA
         1LNjlHup5KCKTt9SZ9uNQVkWjnPDHWApv1B1xKUuYUkpYmj0VwF8rwFSiTu9LTc9pIui
         26Kzj9h7VjAMut0qbFoJ0cFeSzadUBjpK7lgGVvMNdcz9Zj0Clkn1c4/ruRvvgdV5U8y
         70tg==
X-Forwarded-Encrypted: i=1; AKwUvByUJyio+4lKXGCdwkqnX5FEyq8nslc2znmBMSGgoLLMrfkPdBFa70htFoU3yHnnJIicEODOQftcbsKjvXPx@vger.kernel.org
X-Gm-Message-State: AFuF++ncbnN3xux3S5ajLJYnT4C5o+fk/5JwA+57/fWPCTH2uaN7gFto
	jgjTa+DGDSoVqDdqBFC8N6x5Ec0msDV3JULkGjbxc96i652WpvMTEaPuucrrReQOSVd9u6AKWos
	Dkxj1m5Bku68KssZ3svonCsDJpH9hxZLZoDl3RzpfCxvA/TMDd8/JFDx17x3fy4ZtMhng
X-Gm-Gg: AYBFou1+RjHO3gb4lOlZo66iJUrjGK+fLln/5/jucw2qN1xg5gqZM2quvOKiVHLp1gf
	ACqVTlVdlViJIC5nnT7+9eU4I6PJEY/PDVriziN07xR79WhhVjL1ha5BRMzXIRklVkdNRD3XIQa
	JYK6Bf5kKFLPiWdUxKqVZIa9dSTMfBPsSmk9LSRvgc8lZciReC4+m8zAdFX4ew/F5ZYHMKeH6Kl
	aQGSedVZjbXFDSj3gbqRfAGxqYPOivm+rjJN3aDJMyW5upxJepDh+/+QiW4t2nFE3MjCQO/56+n
	QkOsvDYCrz4Ag3xhP9t85HsoLUnTnbvLkYkp7ODuSpAo02Eqa4D7AnEmS//KApVjAzN5FqfOEEr
	U/EaMYH6W0O6zW8uCZCqH9sH4KkMiVVo9aNu0
X-Received: by 2002:a05:6a20:2451:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e16bf36b7amr1604009637.71.1791551597032;
        Fri, 09 Oct 2026 06:13:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:2451:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e16bf36b7amr1603974637.71.1791551596530;
        Fri, 09 Oct 2026 06:13:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:47 +0530
Subject: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=1193;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dGoqnN6KIe5hbkYTrJjeiwkSgDmk4QM/8FHs0528jZY=;
 b=mwJC2Wle5y9DraET8yU0UbFOoQINCyNlgzcL3XvjyW25clnF/BqnDm5lD3K/t9H3hMBfhKPnK
 nD9lsvUFDk+A5M7Lrgk4cnZB7lz5gz0L/a/NR9N6AWKJ3oBMQyhVBrm
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX/0gk0g3ElX6r
 RJMz4Z1Od6rfQSgTwBhowSs3RTvY32TKmj/9wmaudZDlMD3UU970vrntZYbJ4/f8k0toAC92SKH
 oH6psrudFwLxv8GG4AupJE5TT8EOhO2Gp3U6TwZiv9ZHG1c4Im8drDfvOd6Mdr4riDEZgLcVAdv
 YEuf5JIBFWBRPA1tMvEA0pF/DlBtITJ0XYssSfR0+5txkmu9k+outW8Qj+3V1E+n+cIYOs1G3B/
 AkTm5uvrOtHetF8MDE2EddYkKlE8//2dF4FmPZ4ni4bumP5kQ4UgGQw1zs2apcEY9ol+om5bliP
 3iHIBnis0JguPaK1GjR4H0ezL4dl2FTz3W/N51y4Mb3SWRHMx/pyNDCqPCjEObOzBO1DcsRTXiH
 gNvNO3fVIl9g71Vjj8R/vnFDBIXbNCwboFdwKewBeUSUmc6YDfS+k0NaRagVRV5FKkFtH7RMZTg
 BsaUpuFlkYVHMae71Eg==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8e86e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ljh5d_UQWXVlYs_0IVKLJl4fTscCIABR
X-Proofpoint-ORIG-GUID: ljh5d_UQWXVlYs_0IVKLJl4fTscCIABR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX0oxtjN2U1TC/
 x+gUyDXVBd3T3nwMYwefcnzRAFdxRDv/2utSdl/lLEDxFmG2fDdQ+xDr39By1KRuzc/a5p9VVgJ
 u8bXZnggSkJc7UDZcmGhgyIJY6Hpgbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a..1b3803518 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

