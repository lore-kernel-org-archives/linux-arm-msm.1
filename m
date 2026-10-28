Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200881;
	b=0Kq5wZyDSYaMoUoG2b7Bfin4A16ML3CNHNoRDGJ/mHCWs1gen94bGMTFGMX2iRZNBUqZ
	 Ow1rGokyCGCn8BeBPkkHZn/kgSITEDpIenNjIaJQ2SKsaVadkFIUZrK7WJYc5OVnB2dnR
	 ynbQePobr/Pfo7dopFX9Cf5lSx++VCHzgP9ti9zL448640HVNGpqfhIdLXYbX/FWQnRlQ
	 MV8pyb7Wd+Vhdrqn4RIBxQf59dhOvlfMIpuHX3hyZrF9wdt4ZH+rI+KD6mvPY2f0ELzXN
	 75PavTuQqvu12YufHk1OTwTb0Unr05V4j+QKcmJ4gix9q3sCiNMXJBttQ+DDgo6DMyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
	b=uItIbjnxtNX7kNiMD0apKbe0vtlHvoxzQ3SGl0AQcDjhbKOvLzPgbRtAnbwHd91n8lxz
	 ir6VJJB3323YJV3uj2JZbS3vozsCq103OIND2lQxYBEh7I5j5SXgLiodzJbubnuZ07bLp
	 FY4MNx2CoVlg0vPEzUKaLU3mDux4m5JmZBK1J+eEFqhsvxEIp7LR2QMldy7nmAnF+05dA
	 H6E5KYMzwgLUuetsnvVeyHoQvXA2ep0lbHpwVjUrBLBQqYJoKxJsrj85yoRpkIcNgt8xo
	 Iu/cgHkCORiLOPKnXC9NPOuTxOMQsqgz8b142C1VQM+ndCWE4syyJ0dh97HRAQs+Puw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B796606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B796606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA43t1471866
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=; b=KRYNh0yFFoU0mT4v
	4JaShUVeJibTvkNfb1NC3dTHo86I8hUZD6Cl+hl9C+3prZiaQzptS3YxxtjFSGU9
	DesKvPo4MXAN2DPWY1zPzjfYu8LYhpuHFnRf9WiXUV7zbhjY0VZCbX2PL+6cs2GK
	yLKD5xo2KFMmMIncqfpgazcS5N7jnpHoo3Y6KupZQl/n2axKtF6icblpRdBib6Cw
	WSkPFJkUTB1LaLIPOQ24U5vzZQYNm7MidcJd4WWA6G6LF3/N5PU4ppR5EucnEFGV
	J/yIAmT6NSPbUbJOm/kIToX5bWujlEAVLq+gmFhGuFxVmkY+MWNX/IErOg1JqQK0
	ly7Rsw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh483-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-679a2297c50so1059182d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200879; x=1793805679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=cxHkwG2lZicuu4/8H5A4beML2GaDcNHU59vcYlrMeslz/Ys8xdhYh1l+tBIedY2PmJ
         aq5zBwGI7/YQByt718MJIAKGDWuqaxYXBbQUgc+0L2H6u5sAwTZiDIuyWZkHFwB/9JsQ
         7xVyHo0MxYAiXSg0EIOAo0F8dYcW4nz18BaT9EV8O77+hJSkKfkvWVMzRPqBcSkN95FV
         cw8GYSqYH9pr4HU89VUun3ZKbfQeacto1WO3k2jNxpDhXzmVl3NxshaHWGyz476j3kb3
         V1VJF0RI2rxSMnD/Dt2ToULs0MYe0W4kH5kGIZdY9TD2QAUaw+/Q2YFNoawilyxFpF70
         PVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200879; x=1793805679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=dB4VyxNzJVxqbp+94mVgtTe9tz7GyuguXBOnGcioRJA4oADJuH9kl1X/f/1JHnIWac
         +/yfVBOFyJTCiGdbO66yuYJfy4NMsK5Z2uCk5kc9u/OaFh7f1R0lmqBQg+zN2RxIOIzE
         obx/yxxlcpGHeKQLG/3UOJzj2/1KyGOIXa0+76QWQgrRMN0IABNFWMIk/zkSOzaXOWqH
         8UjpU4ZZ0WLNMmFF+x102PChBGPYG4lZRVpPQA7MesrN1BwjMcFKLxl175kq/b45vfa4
         iKWIBHrAdafFyR7eiWHP3c/v1FU9McYMMUvr4SWdLpGiNprLM1ejIfeae1yxuH7wcaBW
         jKpg==
X-Forwarded-Encrypted: i=1; AKwUvBzjWvJoUcLHrse6mHeTnot5darhTnoETEqCNiZZ3SuckS+auPEzJAgqhZ2m+Rwvu0BZXHnYan6D8Q04VMvg@vger.kernel.org
X-Gm-Message-State: AFq9FYIDZFU44mZMDUcqtSrsbImKU5VNZMNxG44uwkILFU7WER2cXzN/
	xTvhSKHUZajdfz0RloYUtk0tP7FA4wX5ZldcAfGfMy+Fptb+/yM2cA4P054U2EWEhXngP3NdVJt
	80jHf/YY+e+q1ibZ/lDPVjOhP7i6pEVHeVEfsb7MR4Yjh11cB1x5YCeSyGPxOzsTprAYG
X-Gm-Gg: AYBFou01mR8PoxcNz0b2XH0YPM2aFiIlvjB6e6pNi1xg4RxABG93jBZOWXoyX8BQ4Ek
	9w+B86w8/79rmN3G69Uy19nnsOV1Cze8RAHGfuPj33VZKccN3887Xnky3s7bAT0h8zSuy1Y8+qg
	VaanSdMwL89J9eHz2nD+9/MLz1uAYq8ohsztdC/fAxwzqu7/a7EdFwSXRXtImBCZb2L6Kz9rEig
	alzh1VIxUxj7JaVRzQYwya9QN2kr4hq6J/y8o+v7N8G+zuloFRzpY8OMpyniDVxs1VmAE+EhsAY
	z6EsM/d2h/nEWcGRxht2oW+LFWevwC8pjfI+XGlH1e5HfmjsNqfamXhVHZTgn2cOItIRwI96BUK
	XVNSf9vLHF981pZEli95C8huWmHiKHghrBWkSvyqxo+9489FV8nSJkSHn70pTrE34G/D1o5hr/r
	77IdC8UQCyDiz872vyTR0kEmFSXsSfdX5Q01yUUCut3ejw7kwNZLpvKnqy+C8D
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298205d50.78.1793200878674;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298159d50.78.1793200878048;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:41 -0700
Subject: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX6Ltn7ztR3Nz3
 F0L1HQXzfJpPAogZSZb1ZtsoTzROOWpbyTsCDDYTNk+8AyuCYpiTZ1Qy5fBb+fK/kKyqFTH4YEi
 8X504ZroIax9D+UEA4KrKQBmqnoIpVAHe09tvGGaziZsMPTP0U5VfieTYRzWNul9fQvWJkrsJTn
 fKcOaAsIQTElBvA2l9yb/aUHSglEXqvApbXjsIqQjIsYBCta/Gf+pW+Bm5e3BNbWF6fPWcdzl3Y
 ZmL1xwaOu5F7NBVGm5u/f5j+r7iwDTZ0hHEWLfI3rsY5rC7b3dlaRHCi9OIx2xA9eFQdoObA60e
 xkAwUhexqQluL0BlfcStZM4OsqzcHWNPghP08vGN+vDE30ahaUcNp4y222MFuS46MVqF8PIDX6q
 CcMUMWvkf9RNvF+7ByJxPIWf/S79mPa+y69fathL0/WMKUqjEYD6KIlfzlvLYrHxfY6ikdKyDBr
 a/NS5U3+WtvXvkcTwHg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae212ef cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jNWLojqFtH_lE__qK8UA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: 3BREEm0-U3j96oMXXP8lxswc4GV2Wc0d
X-Proofpoint-GUID: 3BREEm0-U3j96oMXXP8lxswc4GV2Wc0d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7EjspCyUj7jc
 3I1rWhofo5uXn7IeOS2OEwNhu4tUPXbgVB7wkpdONm0dGuxg4VuLqF4CfSUZAg4BQIq7RvHLKZu
 PYGCQRbc7GHutATpvBa6qCVpmOAR3LQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..a64242c66cf0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 };

-- 
2.34.1

