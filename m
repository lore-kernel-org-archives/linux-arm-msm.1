Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066530D3E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143998; cv=none; b=D6F1r+tq1Ix/iHXJAx+sAY1CSAeLKtYUuFVcYZaEToiFwNruCjrHbBbiUAA/4Lo8pR7MUWlcTMPFp1mrUz3yjN3wgLB+XiGREAipZIfBzlvgCcbV6ShmUrHY/3PIZr4vuFSafvTCpGCvEMei2T68d8vKQP9e8QoJUjW7wPYL4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143998; c=relaxed/simple;
	bh=enf/ChfJuw62s/dLbHxmRKRDFhd/1imXQzdq152zdG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR39e9ue/6qFj1NYUtUGv+KMJ02u4AzPm5TRCQNb78eb5D55uDnrRD0Zv+o6lk9g/hh0XrnFXxqhI4fjk8KvWLp2WcSt7vx3RiDMrCnqv24A2q2yw7i7SnDTttIysFsFYeK5OITXiYM63ZUKU/l5+sfKnKUKI8lWTdJf55DpzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLUJ2ymX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccn/dgXv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLUJ2ymX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccn/dgXv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClN6w663154
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrpSItTMH1LmlqMo303GcL2ZZlarkOiJ66V19t5rHmA=; b=XLUJ2ymXjfwsonLq
	EWcmo3dQsp9nffG0j4gNZJjoRkZlS0clgZ6eGwzqKaZC9iFcz22GWO5paiXEavab
	jX/IPsDUtkQSURv86BR4/LIjWCM+YNhfMMvM49XhHt1HqjvIg2gE2G9dQTMUZaeF
	vZ5K9fL7y77hTIlaVEF3vwo9O+znpYQ7kEQ0tbsHj7q1frCw1CbKhZClLnXC/ghd
	MimORkZAbieYvBBjA7VetD/ox8+S9OF00//PHOxr929lM5v+cgHtQ5EyDvBD/KR2
	OE/um8fI05EOQ7nTV28WVdvbLa+qK2zW3O3uqi+zDokltNJ0P27dJkpYxpAe1Sbr
	odY43Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936cadb0e8bso85985585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143995; x=1787748795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrpSItTMH1LmlqMo303GcL2ZZlarkOiJ66V19t5rHmA=;
        b=ccn/dgXvHeqlC69lLY2dhERuOGtGFThUjaAU1stOsitnUIXhhCS0TkLpO0hGDtvIkN
         JplP5RChlkGTTtxy6KCcx1eFk9WVt9e9ZXenL81CDTjK8AOmBk+0dHQflGJHeQUuh6q2
         lDhCCwsBFgLb6jc5r0R38RaaxN5GHU/vTFWAYyXpeudJRLX3x3S6Qc75rWlx2ynLXr0C
         9RL4qSf43idRVXt7IF7hhqI8un/jVOtytv4TVtzXZiyKcQ9sDfdbrxshk9PK/ozEx3F0
         X+h2mpgCZ5ad9C/nHAa8Dm/NGB0CGGg9Wgv0bWXHf6KVdUil2LqxRfmWRgu5ZNlg8kIs
         ovjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143995; x=1787748795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrpSItTMH1LmlqMo303GcL2ZZlarkOiJ66V19t5rHmA=;
        b=Ho+FIa+tL3FoFnw1lzMEyqbpTNxXO/ymrKbowxauuqEyYRHcKoxUX6G14cbfaUZYsd
         pV2HB1yIODwQTfEP0AV2d8L+GD1HPLC4wtufZ+2OH+nbluiQpgRbO3mhFrLr1S4fPahE
         3iwC8U9L9gxiMF7Ez47B1+GOtLZad1ev+tI4rgb7achqLOrsWdBSyP3u3qi0Il2IVaFO
         8y7ahLlWvavZ/lJ+GYMDWSR9jn6F9QIceMtiDl63RyAIn7gpmgvOSR5p9iPNkKpD0Ojp
         GxBQ7cBYtNovy8fVqW+X9pe3cwsJ268et+Y5GsGWazQel7c+WQSoGK8yu+FSwrBZJlMC
         zeMQ==
X-Gm-Message-State: AOJu0YwmQ0r8NPEX6+IfeEnl5nCKSUxiG+SQx9rVU2/MrEOya6RhvL+i
	olSjj+AIMeqapcBBb/TUf2H1IVrS1YqKuNFV14KCCbDw/D0gGvelKVr0qJNQI2I07tVIKSUEfn+
	eI7gtA49A8PYjYRKKuCwCnC8e6meghjVw6ozaI3l3uTYeRg9rgyMqCRcSyantAi8N23YC
X-Gm-Gg: AR+sD1310oogxWSEIPfKq6RfdpP3Hz8Kql8lUvLeTjc37wKp0HHPtPClTaed1qAIWQO
	kYMp4jqgH7BnU3VNmINAPce16m4teig5EIpBkaJ1Smk2N5mDsHkgr+g1I8tKbZn3wDCW2ZrP2wv
	7OpefYBsHZVWz6xXkgBLWYtxm1GcK+9/dCNdg3m3+4LGdEMODH2eU6kKat9NmhO8LrL/QtsTqLC
	zZgmtujATMgc0/oY5bltCJAGGrqXiHpXIEj6NahvHGEhRxxbc+SybCoo0iaY4ZbberYCVJjDu2z
	1Lzl+LD3Nzfif0zbLgg3Z2LLRNEf/LBa+Y8a40kUPjTBOrnRhbi0tXBZb8ocXfsGYZD/3f+l4yo
	9/kmaD+7z
X-Received: by 2002:a05:620a:390b:b0:930:b19a:9d5e with SMTP id af79cd13be357-9371e2cfd18mr297938085a.1.1787143994824;
        Wed, 19 Aug 2026 05:53:14 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:930:b19a:9d5e with SMTP id af79cd13be357-9371e2cfd18mr297930385a.1.1787143993599;
        Wed, 19 Aug 2026 05:53:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:46 +0300
Subject: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=enf/ChfJuw62s/dLbHxmRKRDFhd/1imXQzdq152zdG4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhabwlSzg/K2qpFEVnE03BFYSWbYkQ2t/sVJ8k
 JWPtPXI6aSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm8AAKCRAbX0TJAJUV
 VljxD/wNtoRVq2HAYT3rBOpidJfnlndh2hlxOdYcvn9ELxtn0uFO3j9vSvakX9FeN0pKBkPLuat
 0f6VEa2ShvYM5h7q90EHSIjn24bRSvKOTDzP2LSUMR3yPoKEd4pmG06TNIm3b5ZaTsyZCyu/Vpf
 +tjW57K+mAJXk3MlDoGphYkUuxiVwEfssaKJ33QkS6CXjp57iUAP/wG2tH+u7A9R2EV1eb3pDcn
 CmQ2YDKn1d34HN4mX5ZT+u6l8ZimguC8TM+WhsZgxme/nt6XTDNf0psdCink7EV9OuPNU10fuZJ
 luoyUUbz1WMP1/xtD9WhE88Ilw8eC5Oe5Qw81k+HB30o/Hy5cUom5AG3/L6Y9EKi6AgkTkp5fg5
 WvpLE52hk2m1+1AlzHkV0JkNsPWsCRO219/FxMsVHSPsQbI+OetpEOJ/d8hVM9hq9SUz4YMCaLD
 v8yEpoL0Me3Xc/bebK9Mwl3e5Q6uHKQMaBQBwTwKu3vHglBMsZm53iLX0w+Ax7/nw73J2MBNcoS
 rpDHrAO5OrnxrqVl38SPcdrpXnEZbowZsJiYvlENfHQcJJwoRBO3fJinSOeCwBpj+b24AioYW+u
 MhABAomeJEcsA5driiXYcp8rPwSjA+51Ao+f4g8ky9BPBVtA9EBa15q2IkYnKC5wK/DEgQZLIbs
 g7/4EXIx42au47w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: lvMfwvs748gEBm3NoQcRazITEqrkOfaG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXwymMIkPyJSJu
 9KaMMEQkL2Po2fMx8DbavPFD/aRraJU8F1ANFgMtkfIhI7joYdcwBPwjzdJh684PiGEG7yV2zKW
 T9rRN8fEjmw3hlGDJwQXgp8ahuSH3kI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/eS1wTrcoE17
 75Y6Pwmjqy042apIoqIkYSAKtHa5R90GBbQImJ0M/v2nvD7CC0Xi3ZL82/cobasY9LU+sMoaMLm
 A6UMlqIfyIpFgeWu3e8sNgy5aiP+0o2NMbopas97kfF2YQeedsBDZu8eNmGZ6oU+64+b27F58Jz
 VQaUgkv+fqAU3/eBw7ggky97M6+Pfau/4tTrStOuUbDfTu5gskT2mC6uTwDX98fBCV0/J1ITNqw
 ljJRWlFaE7/JnYX4/che72DzXA/2nErMZT4qhhAmksJp6OW/cgZy0JNzbN6h4FaENtAQqcmVVEd
 I1zGyCi3aEjssmh/RaFQWs02w4AfC5KLO6bRunn2mwzHK0XwTsTLDiL+g31yG8T25aZIqCx7OcS
 FcyUOVu30bujdm8i+st1IS2gg4Y3eQBFB3o2WbA47NJYBREPUbFI+mnd8+xk9twDuirjeN2jcBP
 OfvvRGwJIqgUvqCv2bA==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a73c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lvMfwvs748gEBm3NoQcRazITEqrkOfaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..86c2be3804c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.resets = gcc_sm8250_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
 };
 

-- 
2.54.0

