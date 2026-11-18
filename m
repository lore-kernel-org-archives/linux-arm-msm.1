Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981770;
	b=ZraXpOq4ffjt8GUrRw4p0jqmk0/eGM+5IGocNQt30vlP1AHsYyt+ISZKOuMjEbn2+6JR
	 qgJ/q5e2TCZCIf4XacNYnwiL27SGr1lX/lpdIvX2oLs6wdl7fUaVVqhtaJQagxlvphHJV
	 YascBc6hvrXkFWISxtBjU7RtcmFEhKgeDbDqMNsZ0tCpB7I8oG99M6fYPpkXbZu4FlwEx
	 LVFCw2fzWsumBllXKc4IVKE3Rvk0DmhQWJihczVkFP8b9guE4AndUZd3dwmLEsa1sp/Uy
	 RX5XCfVQCx/lzJRualxxDKchE4C3fffDyS4ed5UmvWcXidLY+J7vt/vtoQw8R2nNdLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
	b=SyF1Y+xYOP2xSlAoTqZVbxY6RcN5U4kj+OJQY2NLae9TLUFFdHQ0PEnX3KNM85cx9OKa
	 KzqKWpmlD0J54bmgwIQPgH+1ruk54fT6pOG+ORODZC9lnCCCpOdMe6A2cKRldPrhgj8uA
	 Y/hTAw3f0u3aDtumN4tonnawaly45NJI1AqIcn7H60nhRcYqnv4L2x9XQCoZZJ5XxU73e
	 hPXfutpapYtsOnajB+/fTxV7pw63XtKikTJyBtVD5bHcz+dLaLkwqIjiMApfsub6riP96
	 EbPovcS0e/aMNlYvQYIiPu6DPS4ycc7flGlRlvaKbQvbmpaKpwIhITA9a5OlZ/vVUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RIP/CT5c";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E7606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RIP/CT5c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1lL3121825
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=; b=ewpyY2E1UyI/b6Um
	nsb7nQHTdaVRCIhUELeds7G5Dd64qm/SDFp0ssoMM76QMWyvOoYdwXS/bO0Ls6eT
	SreOaoeRVu9R2L/3/OXoM1jKEBuPUVwie5rNsvrsdsdUTQ2EljUzzXK4EVf2r9AF
	l+pEAnJe7ReIrnkExkLQjIZV4nL+oGtkuf6j2vmLaTG3zeLLfj0ddUIwMUbCCm+a
	b8+0tW4yJ5b1Db0CI3j5M3W+1tyJ0tXHY9u8ZwaqJZcMDPp58ZiEht3kQ9NFqt8L
	zsVyjdVPI8LKoJtkHL/7zHnM8m1fT20MyjAnmeW/L58YrrX4lBwONiMf1mQT9JeZ
	gVqWuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9he83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efad644688so5630115ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981768; x=1795586568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=RIP/CT5ctsHrKe9X97iMSdBLkUuGzK0e6JVdqYKvuo7cyYUA1+zrfhSYBi3WvkKPVS
         TBcAFgtpiVvtOA7eXRa4tbw0k4++W1A2IKmWIw94pO6rW/67oAPVQvK64CqBsNAq9hxk
         De11c3c2oD9YOCi2G51hxND/bJ3eI8XgMex1rNSesfgSQv5hgbNvy0lWy1zsQsXVfQNo
         4C0FeUTWPU7Ucacbr8IoFg13nPhU6rhueyXt2NuWrsTZmGr4bOwKoZIA4L1OgL7SXPtL
         0sHtvXa8V8bLE0h5d59sLWNuRwd+Jhysvbaza8hsDVuwAlpAAQ1dRgOPjP7n4vcqODtU
         qN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981768; x=1795586568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=DkoIAsSDug8uK31F7YdHp5YR3h6UTSi+63KPbRJa1tTMka0BMP5M7Oo6HY9kqd+fsJ
         D+rhqI3yyO1G6tqhvX4hFAjsPILesnegXr54YPoi8ki5Rw9KelRb3vduntEmErsQ+Ftg
         4rSlVxg6DKQbtFKNYu+LoKARyEWjbjjhsRe/gggspnFwFFB9k4E1uwDVqD/LUXuxr1EO
         m+NMF+dzXnO7oJxiX9ASH32FbXCvg/R78wUqa99+HoQlaII4K/iKNOPWwY3zEnsqNvw9
         opivq97dhlAIlvUetNjjWo1qC0aWSiQs7KYi/Z7PBFhUgE7Jtkna25Kcy0wiZpMCV00R
         7DXA==
X-Forwarded-Encrypted: i=1; AL+hErFrex08m468E9kbq0zfntxbYWHZTqkA7LCvz2A3ZN+4VDM01H2UnFHCf7FDPDzgtJEsPegiv4uDaVEqqmZ1@vger.kernel.org
X-Gm-Message-State: APuU4Z/6gEcLz/mpPXsiDgvFD4uO/ldSPxws6/t+qa5bZFwxksgpRkTK
	HWnWbAoUZSA4LMi0NADi9fq0HB2KC5VqRmU4YMDBiYyYYCxqDuYm8GHk3qBEqVEQFle6LPnwfaA
	KVfamE08/pcAlVJFBi7yNB9AgsPiJ3JzMDlWtm4Fc4jT1fIpIPXKVOT0DmCQ/zS+5SAho
X-Gm-Gg: AZFdTZfVZGXBx/BdpQMxyI6LSzubGGo4llR/seRHL84FrfJu8MU7VP4zpx6DovsTM9c
	gKp3VMAaHImMm0Y7uKw7xZ0n4hW3JvIAK9S409AhAqpo+jGpkKL7wnmuLI3g9w69oA8/SBFoViE
	aO1xMsgt7XGks7jbPhA6NQrVP/iVJpM1zb6FTQxCsrOV3RzXaAPpeQpRQWNTmleSES2fXKBzUML
	P1A1PHq69vLUexRfngM8myY5Y9rPVXoz9IcG1Src90+SgZWhthYDYEdiX4sXcbkB7Q2EC7GMZQa
	D2I7B6qaDRDSgk9z/6cEpUIZt8wWZIK+GIHMa9WhL/jMfZ5AO4a0jpzTBf+aOBBH9ZkmBTOZ5yl
	VietcYJyP+RBUlXVNC42IOJHrKNjrcn00zBvhdfvZZQx/NvX+DPAk2NDdoUGE6UHLV8Ei31wn4g
	==
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055835ad.15.1794981767712;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055495ad.15.1794981767250;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:32 +0530
Subject: [PATCH 01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-1-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: H1Gc1fIT35xalVlpAX3auUFfeKhzAFTH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3pLze3s9zsyr
 H2ggi7lcteEHfn+VMmgN63Nk1CjceYs0JKM/lEHCu+Kl5ZtVHxC2pvKRrEaffbEJMaL+qp3ibBY
 60f0l5ZmIwrRG7cDV26u0gaxk/CGqmI=
X-Proofpoint-ORIG-GUID: H1Gc1fIT35xalVlpAX3auUFfeKhzAFTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4FS8KVlylM5l
 xODNRm9AyvBhvU8YnF4SzBOpjBnpIMc3wkQTb18dUEnldj4/k3azmmnhHzEMAawsu5xNdGGE4N3
 WNEr/l672JzSsmzMvXUPhwuZvAvDFXwjKRp4V2N4sftm9eANIaAgZVjwPzZYIbJoMSpmb0wswpA
 2l/mPYlKz3UGlf2bBg0W7f563PNgUoRYwsQsMOl7zslV57GKLLOCGtUGNukiRAzPTTo1Ht9dxCV
 uvFe2jAORRQW1OLNAKFLwcEl45cUzzJHZv1tomjfQUSxXDRgDSb55oqfaW/bCFYsNZhYwGfwsfm
 XapFzyHRxWjQn7NRbzOQyuI2Eik3PqzeSIkU2Z0WtZLfxURsLzpOO+TGMUbAFJlYyTJwhG9DoeB
 g6I4ca/wXd2dkBoNWmT5Lu3qQgQDElVIOm3oOWtwNHtrIYCBoQmWHkbOwYrWFUYhAdPvSEPhB8C
 7qdQHwKwU8HlizaAyIQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd3f88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=trGgOxTnYlniadtl7JMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS8300 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
index 489b41dcc17932ded89d8e0fad0e284e516a6042..3d499516767a4aaca5224b3a4a901ed2a90b3c8e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, emac0_mcg0, emac0_mcg1,
                 emac0_mcg2, emac0_mcg3, emac0_mdc, emac0_mdio, emac0_ptp_aux,
                 emac0_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5,
-                gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
+                gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
                 mdp0_vsync0, mdp0_vsync1, mdp0_vsync3, mdp0_vsync6, mdp0_vsync7,
                 mdp_vsync, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,

-- 
2.34.1

