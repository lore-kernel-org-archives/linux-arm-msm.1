Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981868;
	b=Dy2Srupz7d9mOEPYOkWOixsGQfeLytWdMkBqkn95V6rZtsIAUzEQ2cKGfrasKVgWFoyB
	 Bbu9cqnYRQMBXpb5JOT68ZMKoZhS6fhc/+nPDwKl4U9I/NwzklmidyCfMU3GXIIckvv8A
	 PQ6R5gJKOqQROrbcA1iaypVhXmsfwrY3T/+N0GuWfgaXfq8VkRO5htbsINrs+fdCEQQcQ
	 0jblt6ZnQ7eequyMuy6bKthGczp/U8ly33WvOz3xc0+uasTi6CXbVA3d3WJ34JjGRgO6g
	 wOOSPFaUwffrZon3vh+y0UZYFOAVbu9I6ei74TAPPP/JZ+NVDGjNZikWFUgLcjzuHeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
	b=HA2pfV/xGvi9Ys0MdfyrhL/sPHWu8HsTvlK5ssSayQKcTLURMfPjSpbd9Ti6eQiouTlu
	 kiZ2TF66OIRvk2gw3OLmw1cYx0JzdZpZ0f5FXO2cdLI9WJRY5DeDv3gzvWNqh1YOVL/ZS
	 AWYYteAUResl01oWhldI3L7+bAhYCOuS8L+eM0X0xifDa+TNdzR4ZfJedbOGxJD8JyyPw
	 QQ1JfFuvgLgI1bIimU0C1KoOLV2UZ9ot3uMXuHuYsyqTatjHz/P0nlqISsF0Tafheunjd
	 gZfbdu5cJI2Qzer1+03IZuQ438NcnKPDn7QLzDtVBb+6bislUQYxppWEfMeHS3hUMIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gN0tiXrv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hst6/+4M";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D548606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D548606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gN0tiXrv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hst6/+4M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3ZJ764123
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=; b=gN0tiXrv0I9d5IMg
	qXHnkdD/PHLzQx4tufE2N1HKe64qmUQClg+khKuViP5+vk0LqmZ1B3uo50L/R8GE
	SdJznqDM+LmJHhJTGnnm1zNCaWixB5GdzNmOfVxcMN5yesOH/Nl99WjjWT7yi/ct
	8cvyTcUoKUK/oumDe5TdM3ksbs/METpC6bcemyDQKnAo2Qx/luNqsH+4K7kVKds2
	0KDUrBf8MeE9EFfJt+86ae2FxAeFkwEgdgCIbRDK5bbwT7oVs8AnpuKrKpgMn6GO
	AQ27Vkp8T/bvp1/i4VS4dmGRSp5F8zihtgIGCmoBTYNkLM1XNT4xkzXmPec0xZuM
	ww9Hxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9f30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso5893515ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981866; x=1795586666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
        b=hst6/+4MuHv81jqJuS8NnxsIpUzblIesLBPP/2FxmgBz0lynUWa0C0AXczE11N90N2
         D1Sn7RC981VDBqtSzLewQIOtZzjts+EXYKNhkutuG82uuOHWv0Lm8YUz5uPsmpXmJ21w
         5VmtKASzI0koqgZm3e10sShRgToCVSQAFOpqGtEH72gBWQbGJnLCvMcJge5SzpNQ7JH/
         p7VidhcJr1cgzpHW9lXKO3xCh645N6EwZFcRALha2ecGRDXcUDLriQTOWgg3FBfTEU9d
         Hwy44NK+Pbo3lIs9Kdigy36A8zDJE4846BoIAL/XY5kxi77QkZFqW6IsgDlXXF+RDup7
         lmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981866; x=1795586666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA/naoocotKqPf2D2cRp09plKfS9ESTEHf+IPnQRmto=;
        b=rFW8Lu3MrKrE/xBYW+Ll4qd9NlyzGKZ9G/vizFkI27J63A+XUUXBvr89o6fQhkjqBB
         mAtF9vcyMyKv7wnHVTabMl08wmepVktAJCSo0X6VNM6RXr7zUrfs6sF1GPS0J2QZEyJg
         DInE3NmVE/mHmwKnxruLQNJrrSmyLXQY/QCVohd74ke3EdQuBNz7RZ4w3zV3rfEvv5SK
         GHUQxnQcUJ9v+I/6FWuq+SX775pdlXvB8K2fbyKeZ6iFP0gi5LXIlldIewzMrIMXKURQ
         bDAEWnTQKn9w1hsiNq91RguiSjwQ7KW+Uzc9qN4Yg0xflp9FDpUay0kBXIJWwNHqzOLZ
         SHTA==
X-Forwarded-Encrypted: i=1; AL+hErEcSsYk8PpB+Lo0JltK7GVsfPNmPzcJpcsjLQmcNmpCXhGMvUUKG5kJVnZV5PDjiOfvPCUn1GaUbhQFSL71@vger.kernel.org
X-Gm-Message-State: APuU4Z/FacSZ0Njbsf84E5/pZhgmRZQIKfGLF+vXXzBieJjqpLOATVU4
	zSJ0twBg/WMbsTW1IRHFRPoAwHEYoDtKDVhDBxuAbkEpUNOYK6vRNwYSw84q/mX6YDkaME1IcCc
	93CVQERKvNFc16JyoMWYR+ovUpnTXa0lJvVNzZ7Y83738VPUdflfy1Gsuc1h/J5a3LHPW
X-Gm-Gg: AZFdTZcZVZAeGut0x9XZEAAwnemd2/oINRpSHT6aXYT6knYCg2J25k/78IYVwE+W1Wq
	JQjL71B4JJTvu1iX1jAHh6osKFKz2Iv2O7T/lut78oXZMX7yhBfouyLJ5hwBt0dRVJzp2xXNECy
	q0V9nFvtyeeinfbrZKF7GCS3KFwZ1W0CpoKiYRXSQaBsgwsreiC0bsqQm2kRu8fNZL0ckTraqPE
	j+FOhE1hSgKtWxIqMIdMijGAVFMTiVF91+n+Y6lHHRUz2PSTPMkRCP5+E29VvyYTnHIkRXICqQn
	GdWVXOBIHxCIBoJPzmzydvvjKs+rPncA4pXIDUzENBRhO2dLU8DZgCjpu7ewZITmJEVpUuMmOTL
	wgxtW8tRLqrSZRH8Uh2oCqr8eYCG8HS8wfAWEFqKyZvvyPHIO7pK9TXt2+u/LI1FE6ciax2ZNCw
	==
X-Received: by 2002:a17:903:2b0d:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2eff757e23amr14324805ad.73.1794981866283;
        Tue, 17 Nov 2026 22:04:26 -0800 (PST)
X-Received: by 2002:a17:903:2b0d:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2eff757e23amr14324555ad.73.1794981865796;
        Tue, 17 Nov 2026 22:04:25 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:25 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:48 +0530
Subject: [PATCH 17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-17-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 9j-w_BcfpaWm4IotvY6wMNO1nhCvIuT5
X-Proofpoint-ORIG-GUID: 9j-w_BcfpaWm4IotvY6wMNO1nhCvIuT5
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd3fea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX+eqQV1qH8i1m
 Fyap2adBCRUJbBNDZYcNIp43rkBoWYWYMzKp3Nss25A4c/YQJoiDgz2Nb72tZ/GfvGmC3DlG1hi
 JD7v+0rXCl542M2+tn9eWS2Gii8cZog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX51sMWlfbNNqo
 2nO51c/2GhwL6mtcXnOd4V2039yvecd9Iq9MoKuu+TReZAHaaeoy0Wm5cqcBThVpTd1bCjGuGe3
 f2tl7TvgUkk768cTsJYm9Va0crTlyvkYbnIK7RKHaa6QVNqbSDt6zlWPBE1mZFaJQXvXaRUSAh7
 CJBr58hG3bIjvUrpoOk5oNHS7uAo10G5lhsgvVTHVOWojB7fpFGbZT97hlO8zhfgGAJqYLwlHIb
 xmAPHx7n1XYILtJXX2DJDTaJcnHLVdkTvqqP3IeJMn08i1r1YCWcwsRkGRatmH1+i/xfB17/azP
 6Xl+lxpQwoybxp/VyXASHWHS4hGwaeQZC0idain5xuwtdHZ5dDwU3Sesap0Y1gWVPaPVxCzk/ym
 KwtjJozHBbT/WrPUIIZz+Jd+xR7a2dva6z/34tCl2wvHVooRWqCCKspTgoZCNPfm/IQJJJyjTGq
 Wa6X0Dn0N88nbzRDD/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Nord TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
index 56758a85ead8d03be8067a133e6ee2cdd9cf644b..25a831d8b83e6cfaa73f990e80d03d1f269674ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -91,7 +91,8 @@ $defs:
                 emac0_mcg, emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg,
                 emac1_mdc, emac1_mdio, emac1_ptp,
                 gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
-                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, gp_mn, jitter_bist,
+                lbist_pass,
                 mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
                 mdp_vsync_p, mdp_vsync_s,
                 pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,

-- 
2.34.1

