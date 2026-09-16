Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F813B0586
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523678; cv=none; b=fuSJgb1CXJbqDVh0wjdfMJJJ9i5jT68fn7Ub0KbyS0zU0VGIpqY0Ryk1PRV9ot1PGmBFHZGTycggX++JM5Ut7ADIslfY+w61UkHSPYIJVbtBZsFvQGmUjynF0Dqu+OjNNSoYESJHcdcFtho5K+AaQ1jOnKrxuqeiyM5+nnnohX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523678; c=relaxed/simple;
	bh=Yua1P7HOLr//+nfS5FhV9LxvTfAlypRaR3BuBLhi3KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0YFf0WCgtxtSoxhPTIL1QW44IcBLMeoAWI9jW879jaZnfcbThHrcwjrm55m1D7fC9/ns95scMXG1r14SH5b13zkxGPmh5xJZi+eRmTarZkR2MMDNliKRJ+djVHF7l/agdhkTro8oQX+D4WzxYLZYOAjtCF0mfAdytWvcfY2aJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIx6yZLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxzEmjIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIx6yZLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxzEmjIt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZJmJ1408744
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=; b=cIx6yZLs6UanwRK6
	dd6I6ssHu5g8URy3x9TDwbImLRNi0R4r/PjPTPPbGy2zv+UxjdlAM2aSgZ9nAE+h
	wqRMaOuoyioVtpGkyYBBmwiR/lN0ApUiKRd93k7cuP9lqq0fEYVuVc8/O6AQPp6k
	zvSpeW7vuAT9+ql3ZPBqsyx23GFKIbq13OirfDr86Fs7ija7v6mZSMGt82LIvVcd
	EYdTQaufJsAwlhWabmt5Ii3JAVQcEzbwLrIuTA9BzNWNim3o+IpnSlGAdJfO7GLh
	a5ERKSdV2ZnBRQ8F5/TYpn3d2AUYUrIclSar31VD7U/V9GPa935aaD2kyY97awnC
	psEcVg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftugbfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:27 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2fb8f0df0so6303393b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789523667; x=1790128467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=;
        b=NxzEmjIty6NJt6CokPVxCRatWEdzXP56fznJfZYg3zcHi4Pd8eMLknIG4kW2yk3lVc
         3R9t2of5/PM9JGuurOm7OFZiDIFydXU9sDtgOU0WRVgeEWI8UV0SXPTGk+ir0vFYtSMq
         F4LRz2EGjCE+yyjEGkpC+hBL2Wz2HcfJtiHJPSXxMkUECNhnXyTukzSZqnibpxd2ee1D
         mQO0YnjK4LD66zafgZMOxLxa6q58peS05pjlkZqLKVdnmD4hZiXzB/f5h6q4sseYODB7
         Z5urcCcoqNBj9JVzKZdOwEMD20yVTAA2Y52i4YVUEbaYBOD99uWLpIWTfoXs7Pl9eq67
         HU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789523667; x=1790128467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u012WehSfJqgxWGj1C4O/PJZFi0W7Tt3kMML3xYLjRg=;
        b=BOLtxg96B09jqj+neuUAZwchDW1Zx18/XkJH/ur7EV7QiAsXccPjER9crv3klzVkdM
         5kOIm5R+s6osjVv9QRr7OBTruYUf9ZP95r7ticYGb7VFQEmP8GnxbqXc0yZ+Qks4Nk2u
         eAe2W/8vjaGqxi5W+f+lATbIcFQYf38Y6p+dgGqZSR9iOOm1a5la44LpWt3FQm3MnrWl
         KUpKUd6FODj/6h52fm2/CnqWHVO/26gnB+k3S/OI9/Ud0jQhiOj/WxoFeKnwxShZwAzu
         7JSOHSPm/aeGpP6SYgE09A4L35I3zJa5VWrlfxjkviQ8YEioj0zOHQpeSEXpdmzm0LNU
         PpQw==
X-Gm-Message-State: AFuF++nnFy137G7nJ9Ayl6BjKkiMOetVZ2Aav1wDwJk0t1HMwRzLMgWb
	yAn0HeE7snhQvKB4IuU3Rc1LbP00IBSJqPpVD8q1Sos47XmP3X3uwZvnjyDl8hzv+znhYv5tdsX
	9TC0fTDXSzS5MyepMib8QJuu96bdofKyIQFq/FrHcI3eACFyiRdVRi8HWezM4vmGZtbh8
X-Gm-Gg: AYBFou2a4O2lkP2rghHivWoYExQtls8ZfhWXeMOq6ONO4VEe9JursKPHQg33Hvc7w4b
	n0utZvaY21UyEjHj8cjrySAQSGu2e5xjJrxXQC+SmDCKEYSLh4sLw94olN7psqfCMMsWiphEQcq
	udZaCf/ZoFe4HNMY0511b5m0AonXQ4vrKzQrrQmGGijA1BBjFRXMohyd/3bgT5+F+Oq0SsYupUz
	AWXS7kk2ADnvmrbV0GcTOJ64nbYN9t7e/EWavzQHJFurIzxdOE8/SX75DMV3dSZzJMzBUyF0Kh3
	NAPcFvgawCjFAHhJxWXYu0JXV8BC4AP0Zpgx/tVAqJOQ+iuJyPZAZI65wXx/Oqa5tyWu6ZcOgId
	R1p8/9qjudJXxGAeo3DJkWjw=
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1306971b6e.11.1789523667343;
        Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1306935b6e.11.1789523666952;
        Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca1e09ab74sm1283039b6e.0.2026.09.15.18.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:54:22 -0500
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
 (UX3407NA)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-zenbook-dts-v2-1-41de8669a7a8@oss.qualcomm.com>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Yua1P7HOLr//+nfS5FhV9LxvTfAlypRaR3BuBLhi3KM=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqfbQZlsXvr7Zsexovx4wODws2pw/Sa0lsQkyI
 WwlHbRktdyJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqn20BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXAHBAAnPLTIQw3s5khvO6OlJFVSFB8qgAAqXlWR54tpf8
 q9SUAmc5pZZQFyUTQ3o/kYJsFsGvwtdzkPDWoRQEvvop5pThljmgxj+Pmcmbi+Au4vD3NM0bg9I
 14WjDWBGmxx5zz+4RlLprShnyhoRfh3ZM+8WvaXn6jZCTUP4/OdEZYrZvpPKbM0GmqD1dXfO3iC
 zdCQ7pmHY3YyMyhHM0rPvu4bPrRcC+cbu47IOLBn2X/bW3FpkFm5WNVctB4WxJFzpA98Oe6mVr0
 cbbn+sKiVBNBUj8TzcEJMx/a1ggHpcU1mG0zV6si+Jm2D5ikIpJ3kkkHc5hqacuQaTfp7CuUMV9
 /t1PViaW+yRlNEvrCOYRpkXzdTE/FQBO51FiQ3UvI8JG0dOVqIr8PHBYSgcDfRJmedpfUBZQC1G
 Txl0qPuLoilnwVuNjZOHbllBPs2P+i3ulPOKEhKWpB5OpoD5DivmlL5+kR+XtJH+KkRm49W21ms
 BU5Mh3HTdm4PmccTpDkG/0LTb07/DlfSgakmIv1wyTxBypv+WmZ++CZ+MHrNcckEUoO0J5BGRq9
 zdolO3gZ5YloLnOK/1BGpcTtIaQlaUw3ETGRHZe5Io1uHLNuSImJMmc7rWwF5fuKnWl0LiyPZ0C
 Kk9yjXMCVuZLjLsED2x5ZlTBhbyb1QuSOTewLGeLEIkU=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX52RzEg1hhr4N
 /bys90vMg36r9FseJZZNTWA/sX2QquYZqtFDvjnI4gdmUnqqb/zkZi+Ef+kBAVkTELzbVCKAuTu
 T4aojRQlzkUpHcwuSF1ja9N5ASY8Y/hUy6b3/WJtNd3XMpxSIRGjBbOFU7s883rUPK/dpRvuDTr
 3KlY62dgIi5u8u4WdsjwPxKdTZOcIbLCdgSnE5rODLfvEofbF1Lot+tqCDDmrIkRlMNsFBdohC6
 jy+c77tlYTZpAXqvWT5yBwXffLaS3hrYoInTyU6v/jr7WJ0cPw33puTQwnV2P4OQvn7Vx474mM7
 eBpeYT1uQW75mBZjRnw8RC6HQW5dfHcQB+VqnkHum6f9Rl+5dtrXV44Oy4SDT/GEc1qTo3lfEFW
 vGXo+j4eJqNQoFmMI1AkDM1OF5FJAYit+dHgqIhNZJqbkD3rClQ9MyU2NSgsxbZYhmUOcgHxcNb
 LgLEGxXjxur1FLuBiVg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aa9f6d4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=-Yt9tNsTAAAA:8 a=EUspDBNiAAAA:8 a=WzdHeGATqTO1y9J2u-kA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX5Gk+ruPLrneZ
 nrgVQB4AN0QuNI/VjfwCLa49NiL6ZgKaNzvdnTYIZHlOh6udfxf+UID4v2IQjOmqozLn2nylBLx
 OkQC3jAtU0blNpt0tf00PIIs/fIO0Tc=
X-Proofpoint-GUID: CflqVk7Ps2IEJYZudidNSJqP4jcpAPw2
X-Proofpoint-ORIG-GUID: CflqVk7Ps2IEJYZudidNSJqP4jcpAPw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160024

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, NVMe
storage, a WUXGA OLED screen, and the other typical Glymur platform
capabilities.

Add a compatible for this machine.

[1] https://www.asus.com/us/laptops/for-home/zenbook/asus-zenbook-a14-ux3407/techspec/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..cf9d940f7371 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -86,6 +86,7 @@ properties:
 
       - items:
           - enum:
+              - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
               - lenovo,yoga-slim7x-gen11

-- 
2.55.0

