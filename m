Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516558;
	b=ceHQVrcwVN2yVsb8qCP3nzssBK+QpsTScgFpAjKkYBNEWnF1p44xsEGtfLWPVwbL4GhA
	 r5pbLVpkXIlVS9riIcnpLhoDvqk6I3GClQk5VQGe5b6CENdIy3KY5OOvwYDOzYotDlz1p
	 pHJtcMJeHWpT2UTAtCtFdRS6esdaISseVBE6xbhEXCwhypE6nrMMt/Orb3grEd9hTrH24
	 3bTV19uqKcqadX9mqC6ghz/TxlPIU5dkIsf2O+xdG1mboV/CH6Pr7s52E+N/jPy7eaRqU
	 L7uZkPbjNIvUsegh1wSlYsEP2vD8oW4L+fhp4Y7hO/WQ4zmlFLX1guOssxh3Q2/b6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
	b=Cpo9dnuYINsaxPh1raKawQxZMWkEDD5bz/Gi/Gyqb0N09VbDcb3iwm5Lhha9t21vXd1N
	 om9njzDEVUBZ8LJwhRrIhYnN2DnP615qplWcxyIkGY+ic2uxlUTQW1G+FK1DYBrN+h4Z2
	 D6iVxGsWWB2zUX/uEoBIrU7FEe3znUEZY/22Shwsi2UgjgjBnsx0LAxUVuMcV04sPvdjc
	 kB7Bl+gpTpWcAo9E/Mud6EbXJmVtpVt0cBOUx00ZftQH9BU6zRwpfwKw87ZA7BcUZfwBc
	 a5avHfFSe4yiHo4ZL6V8qMZY0QaXpzA1Hy99Wf+vZBl6pOoNIUkXy87LplWzmpy72nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nd5VU569;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dnw1O8KE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF30606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nd5VU569;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dnw1O8KE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8KjLa4128835
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=nd5VU569i6ST0NY0
	II1edUrFRr1iX2Q9D584qXkfV2Axjo7BIEniltgtR4mF3gjdfj1GdIZ9XTt8Lpaz
	OwrwvTklgA4zObqZFRA8DOxZvDQeYqdRVdwCLVnzO52jAytYcPk1xJiqsg2ezA19
	Z0RcYyl6kbMiAm6GZptYl83Z+1Gy2OR5N4SI6bg2bMF9S3mqFPYwMVbinIx2jP5M
	8f7RD9YMouxEgKHpuGV8m9dmbs4isXXlf2TIf/Wuy2a7KktqXSVfsvMxi+pVO1fs
	t1h0zrEk65U3mWDb72Y/5cV5o01g6mMgRogarZqttqGezeV6+FfkaGQhgAN05n+1
	7nQ8Cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt281g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:35:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3395330a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516556; x=1796121356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=Dnw1O8KEhO3LdwQhTRgSEQ7Z/Auoo45QVOFkM2x2EZHWLD+XOZWuDPNlzGOcDOMYLT
         xpU2VfOMkUsUfbborFYwKNXCawwBSSioeGdAtO9ZYlyL7TYXXZ0CY0tvcRnCh8RnymGy
         nl/lclkjGNwIGujmWgK//JOOaUXmJucg1vtet+T5Al3Wv6Ku0Lr7yyteSEEeymD4i3YQ
         aWmsNigx6ZZdsZ1A3Z7R9ylFm7CWl6BgMQfhrxYNtMnUCbl6okjS/2AXQu0Lg4SElxpX
         2MgPPJ1vXLcGa7Aqoq5yiDOt0xGQMm2xK4tYSF8j6XAAq4tg6Z2hOb5GC/doickye98u
         j2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516556; x=1796121356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=Puo7aK/Om3xyInq47c6hxup+cLJUEYETvrn1r0bgpHXrAM/GYjydJEYvLWIiI/Mg3O
         d53wfokD2ePPtsS5RVStfOR2upPM19ROjhP/5z316hbiSVAl8FpeqwTU9Nc3zAXha4ch
         WhF4/I8JiQC9CYhGbk2IcXZidrCyfnpkVRfi831ig/2UUl/FIEeNTDeG/PBQYDLddy+U
         sNX8Oc09Ro/ExIYrQ51fgs3vZSa8kqjSYLMvWdHYxNnr2S15uQg0qDkj1bEednHuArin
         YR/ToxtgxhvSqwy636KnsNDfI4vqsSFGVEsaDDEVxnahkiFRcFMFoZCYO6fgmSBQ5vDF
         IZCw==
X-Forwarded-Encrypted: i=1; AL+hErHvKRWXrT2LQ24ZH8ez3Dds+Zz4Xe3giMI8bEmHb4MlOHd7yD+68Ce2eS7LDCJgvcIMAoFNG2EF6rqvex2b@vger.kernel.org
X-Gm-Message-State: APuU4Z+im3N/YqbWCaRR/9n1Z/ECBrXE9UiSIygTVo9W+qoHO5qW6rm+
	dmSX/UyZLCIjQaCyBceNTfhP5tEFRlQSOJm+VPtRSQU7v9L7O3ykPocDOhn3muj6/rWBECFI+So
	yslwuG0eeO/nT7cYBCuQuhczE8O4wPlaeDxP/btisr8wNzi/WdItWNLYcMyAj22ToAJqV
X-Gm-Gg: AZFdTZfCesSaNw9IaNxTuFaRHfkxhEEzYbI7xb3yNort0cVZv2Fy8ucUXcIyc4qxFHN
	zlK3VPD5tDIpS3j0FEFvgv0kxHdo2UrQ3xf3nsGr/7RDua7GkmxSeWcoOhVb4or9+V9K9C02iJK
	znjRofuY8TQVPAoBihDxrYxzGWDn9bzl1K/mBL2PM8SouNfHuNmhRPcnctskkKTJcava+Y2AWtu
	RcSI51r1r+kG6AXcJp3xrxtykCZaYEnaTIlN97U3v1WKX4jTG+Q1tHHAVJ6D7V0IAKXWfrtU+Wv
	Fz6IwCPCoW2c6Tw6I0/6ltsCAfbekI16ENbtIZrz3tO4GyhML/rJBgIHoDS4AIOMji9XKtkKNcv
	ftIT+58n0QyBbu5XtXPLQvnoKHGFDjBi28IsSZRg480d6u51qrl+ljMu0ilx3JCQoZS/xb5EZff
	qBkEBxbdKNXC1ublXnoABlBfhX95iGkYq/aRDh
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857506a91.56.1795516556144;
        Tue, 24 Nov 2026 02:35:56 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b41c95b11cmr12857489a91.56.1795516555701;
        Tue, 24 Nov 2026 02:35:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm9162295a91.2.2026.11.24.02.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:35:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:35:31 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
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
Message-Id: <20261124-add-coresight-nodes-for-eliza-v2-1-48926f5a97ed@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v2-0-48926f5a97ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795516545; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=0caFFdqMB0Cj5f06j5kjvuYYRRB9lDSECWCdXqZAUoJjs1ejhFw5J4Vpt0kBAudKlQ+GBnRh/
 EAsQXJjwKM8Cj+2qUCMpVKWU3zA96cA+6yxeb9RrduvwU9ZdPlWgJsn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX5LJIbWgdkJ81
 jUY6rpDMglZBNihfgSf+7ul3003uo74RfhDFCZDI4SMRqaZ4QUXwJGWD72cWrfAYcMl+qhHjPFx
 BYDcDqTDkJcN+Xy/TOYdQ9721zzolJM=
X-Proofpoint-GUID: Mewem_yEsxIsFkBAof4RPgVmRLrmaINx
X-Proofpoint-ORIG-GUID: Mewem_yEsxIsFkBAof4RPgVmRLrmaINx
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b05688c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MSBTYWx0ZWRfX09GJO3FY+Z58
 SqZKpyLMVcw4FWL3DEp7iCTJy1pYb0NWbFueBUhnx9F/paXw9kygd8Wo4ZmY7lm3EV0ANJbp4Nh
 acxw0JGexRJNN+KnIGboFjVgE/y4aHevq9SD3QmlPbUAYG1D/2SDlrM6qGbCYzObWInPSLrulL/
 a5rYkPFmH9J09t2T9mA6nyKPM0yce5CWgAog4kV9bFjqTMj/5hPLS3cDCrHfa2ay9kmlg3Afwzd
 vrQFudgjQlngnPDbDq0JPLYIPC58zgzx+9t/gUfAfZtCHFd7zaJ3Xo4gPdewehcpVSw1U66+y1M
 J/cmHykQjOM1ewdeGRy5L6PzQHtJdhZcNKftFUkXpOni79uJeLreK50/gfpcISSdv565i/emJAH
 K5tw1G5qHt+3/vmsKHS1ARsvKzcXweTXLOgvZFRWMWq+YklrpVMh/sd/kxz49kgSiw+yfqD2Jn7
 LHQhROf54RFVQ7Z1uSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240041

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1

