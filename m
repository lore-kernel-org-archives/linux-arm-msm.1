Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487912;
	b=jX1RlczpvoeAo97VS9lpeadGPMIs6g+h/GHb1EfEXEUIxtpso78mJzIcY+AX6UU+LflB
	 RNKUDKbKYeEKy/ZdRkgo/nnYyAtES7i3iBHNSIs6DCe6lihs/Yh5BPjxDNYOQ9YAgUSry
	 GXmqSlmWUVwTX9r44wrDxL/Hf098o9N2QluZWogJiH9OAD1wusy0WofJWH9SmOwQvdgG6
	 S5PlmJRou5WwRvO4I79yvAQ5nooUGYhJiGWIqwciGmU17HYN4nGlpFWZWv37/kSAUIi6e
	 R9i9lertE4x65pfknA6rV86pAuH7JWRYD+0qqUjRkua9DcciB2WetoH0Lp9c/FIx6Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
	b=MAGRJ7qnRRok4fbeyx0bfDCBAHXWSfasRcBUmacUBl4CotZq6QhxngTEQ8MGcPN+YZWT
	 nuWZpBKa5NQnd2glls/E+HRpbUGAuqRb1R1iDN/TThcRTz22tcTp7iRx0A6MRyqkHNL4U
	 Rwu28fN0RA7emghA3Mit6Z3Ln451avsSakzhuJh13tu54rPQE+Vv8J8rGxJp710boCIvX
	 4IoO2H1XXibMVh3IxiZxKgcHcBnHz4HY+9+f6Wfshuv0tbZNfcphq+8uXC/gqXrARmywt
	 gfJtx36S5zdUiz2QDNVLN/snknKtCK9HupulJ6NE2+vYafKH/qyvTphffGojcsxgiYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VbRs5i+1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmFryWxt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF3606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BF3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VbRs5i+1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmFryWxt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iwxq126141
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=; b=VbRs5i+1+/PtZ9UA
	E4uuAhmEG7XRPSBXVxphmO9LZEF86BXyAACeumnvnU+2S47/gjdwPTaTI7ohSV+A
	5OAXUJmog0c+ULJBs4SKDeyMuZFkZd+bwxtrgRFqIkXp7oZD7wPCUrOw3136k2gS
	mdN4Qa5xvJZZgl/zFOZ+X1FdK37wh812F2JK8JIgUSLPsimpcOHzUBZgJPLou0lg
	Bf65oSOEkEp9QgH9SEN6mm8qutVbW3yU28b8jimwtVErGmJdugurqcHAAOfdezxj
	JOH4bhADL9e2gDRLh5cqXMPF4nqsgCTSIjWnku9OExQvCK0I8Z8T9jBav6TIXJYG
	HbU28A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a092ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-860e65f42a5so3256818a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487911; x=1795092711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
        b=KmFryWxt0ppgR9ha5R9psCo19GZT94mu1GCpaRj+YrbWVazIvU+M+KSyXeUKiNko1W
         wejQtE4bC4Rlpr5zhG1UI2heEP7Hgh8HFFFdEu4qsM51soaDGwUgPjsXfvJQ0zDyRLCl
         ZwkNEuOT25HuPAQAYsFiRf2R4knq5ceSF8QyRvLvp715jjABjBWd6BbFzzoUCAALHYB3
         F/StiNWj7vlh03WlPRu3cAjA1LuK1aMGenAaM3vzZxsen0HOOQyNtS8OfJ/bbs3LJEuE
         /ENcsmF5qDKzUKCEKIesrZBEtLJo3SbpqVp/oz8S3GxrKqIreYeVZoI6CbMUCCt9abye
         Romw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487911; x=1795092711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xon4MxyvfV7RksGi/nZjGymYtYhAhYgMqriG4HzeboY=;
        b=dZhZl4Y7sl3ZAAr5uv53WfMc7ip7Q+7WiLEThIFp8gBeLFtmj/tpp2SfEj5LyTHN0W
         cYnW4UdYryQeVDk0Ukra7VtxjzOuHfalKV4vHkRUI9h6zD7AdI5hAJBqlZDgkX47eXO6
         TP10YePNO7KbPW9ZJMShSvkJxejmZSC5VVat8U2mHAEi4XsQFbNn+ynBcBxN5lNOZQOO
         ec3LZcC4a15sY8grsXlDgiHeBzMjUhoWRVIJ9/UOFvW/3VyIujlbodNHoWRA8GnSGRB6
         dmogpk5kz6lkzpIygny9Q+dT7O32e1s1FxJ2EriW0djGCcs8/gfKrXhO5R8IRux1eZ7l
         upGA==
X-Forwarded-Encrypted: i=1; AL+hErHXhrJ/scXwLpIvVAvWfgqw77zz200YAYhMxCwH5d+Ib0Y59knohioTWwAsrsiWt8+R/60YjmXcQh1l0qlH@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWodqpdAdM1Aqm1Jw+srjWuzAIyQkhxu1Z+R++fNXWZo0UMRu
	x40I1zK7C85rQGAhVAMzUlPvzWxPzl2KbK56qXr8WIP/R2nkUOIBmO01RoQJhVa9NN22JDxUvio
	OIeBOmD+sr3HPbCRSVD6N2GgpsEOHFbmMPICZd3UipaN1KOSrnAsZxRtVw+dEeCfVbI+eEXAvtz
	cX
X-Gm-Gg: AYBFou0XffME7+nmQ4puMcDQZSj+K1WSnzH/Dpq0SlI3brYVZHij1z4+del6FbwScvO
	X0bUaA2mKGEGS3US7awqZrrca9CeLv+7xGhGncc1R1o13Nri8gBLQXYLjunTQA9j7rZjTv7Ci9d
	OhLP6AKJ6ERAIwI06AfTlx9WDptOMpwKFMdT5xljafFt9ktLbCGodUNxSxQYvxQ0PlqXCBd5zVS
	80Usb73MmotyUQB6IxUvGqQrTNNmdTfdbujJBJDtymADro6/uIz+rVKPkx0CxBGsvVUFpb+004U
	vxJzKdqnxv0RY2CbPocP4e3/kFFTBgIGLUq474oynGjmqDzvKjEbi9XJZvL1C/xNXUTW5p0KBnm
	26aVDh3rrfrH7hCwgt5MYOh7a7ULoQ3kHErtaW+fd0EiXXth5Xw2OzWHcjguaXjUMbHfbOzNNyG
	TXyZcegA==
X-Received: by 2002:a05:6830:906:b0:80c:d34f:5f5e with SMTP id 46e09a7af769-860f292723cmr7032499a34.23.1794487910694;
        Thu, 12 Nov 2026 04:51:50 -0800 (PST)
X-Received: by 2002:a05:6830:906:b0:80c:d34f:5f5e with SMTP id 46e09a7af769-860f292723cmr7032459a34.23.1794487910241;
        Thu, 12 Nov 2026 04:51:50 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:49 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:21:08 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
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
Message-Id: <20261112-shikra_qce_fix-v2-2-2ce112cc2ccf@oss.qualcomm.com>
References: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
In-Reply-To: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: XxkUuKCARVBPGH-q0ngxiSK58CmD0HlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXwZ9gRFhK7aWQ
 Eh35wL7GkUBDmQkJQZjORuKyBkeRIflzpckUF+d3PqXKpaDdtVGciDdYj3UaWsZFtIQS3eWHWBn
 HStLh/bSh/YrAaqUes1cdql4DNKsFyBq7WRtKF04Nw3lsMI96rYLtkztxJE9WGeoSVQh5JAGU44
 cJMHkSvPBTQhiMLWwAHpeVhQUVfK16EyiAqhHoO02TMQ/DO8gu5D2YPcdZr3OpyqW179SP7FiJP
 MpgW51TXKx2xQjVIQNMhc9iSH4o8PeVTHOJWvyRh+ZmMwOIvtf44/3UDdkTE1VM0dsFw1z/MfEN
 uzomjocOzXRAlEaKWPZFqqT69m5rcqL6xmnTC1iEHZ5DQquidNE4uGVgB8TDoUN3QbQsA23V1RI
 tZ/HYjGTH8ySaAT41ZGEGl0rPZXjZZ8oCIdz7jg0DxsAeC5HPfxnlKWHwmzVwwWIB3tYCV2Gmw2
 kWGJHG4O5R+kewErPUA==
X-Proofpoint-ORIG-GUID: XxkUuKCARVBPGH-q0ngxiSK58CmD0HlJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX2mEFvuyAAulR
 aa7z4EkyvDuLjRpVLFeWZjVZ0FXcSYu1V8HAi8pW/FHtMFkiTXZXkW506QkXBCWnikUmLryfhEg
 vqZtdp9ou0c4HqPrsGLe0NSN4ggyPvk=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b667 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nsAWE0-7qdAvx2JcIW4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Add core clock and adjust fallback compatible to
match updated binding description.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d5f0ef863173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1219,9 +1219,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

