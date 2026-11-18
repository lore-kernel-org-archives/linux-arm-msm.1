Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981831;
	b=0RCCyEigjx8Xf838zGKr3a8tiDDHQf7Dsh8uPsg3ZQVreVgIAt60D9D5tKsSifYxXvIO
	 RhQiktxE+iiV//AU6qXYAPqLCvbOsNrjsdZIy358h1Wx9patq5svMLg/bJ0+f5i5pF7nq
	 ldfLJFmvK/n2iwWyn/x+cVLth+yfyXgounZRNEslzpr7UQ/1y3pan3Df4ZSeAs74/dNXV
	 XwrOylqgeB/quiGvnFV5IadH65Q2y8gZLDXZlaGOlxFY/RdXzZEWW8sE8D3LTinQxP7Fd
	 iJnbfdiF0DULCYxrn2nFoEtsP07BUvAaz3DN+2M+sI720gobbak7wEgZZKc97s1A3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
	b=2ZPrZnDfN1SjEuT4vdW1HtUvsSh1ruZ7Oqrlit+VR62vmZIlzm0A7fR6dbLECOWGETaD
	 rth26u4afd/lEsMyQL5FztwBHMLFi830xlMMWKd4ghJxNUk07/dRhWgc3UNMkfLIViQsg
	 nXDjLwvF8V9+LdP4tuM1W7ra0dl2VlgDA2vOAJgTOkcS6fF6ENyT0NEC4Lbs4lBnPbxhH
	 8K0z2ubjGrGLoAlYXIEkWyLgMWJ2SKhjjdGikhPyZwtwBfvnUIk865W+8WEFm+udSiaqe
	 sro8210GDGTWRE6OsggmiV8sr5P/aVwdrCwwOCEYN8FxB7nx5qSgfflgCaIQkCXOYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A4606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 561A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3i7764133
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=; b=ZYorhPEm7sZKzcvR
	73Hi0ohJQQTWnO7B7Qm42Wt5XnrWHizxkW3JeeGlEfFrhHslC1IcbCeHtzAv2+/c
	UbtY7moUdeGrhi05bn3U86CzWvl5ih8tJ2sldslBhTY1eyseBmgy2AMnbnhPpYj5
	nOSJY6WzHgjmtn2W7s7Zoht00ZIPJ/n10xupzbdc6eDEPxciXm1V3FJyC8jM3uD7
	QTrAOyU2wjAekFjILTe+kCVCm1QBgWkqAVxaRI8hdhBLAcLGXBqA7rwXB5gUyRPH
	ZEPjWuAkejnKrYrGrqmRzxwnw49n2lLdnKDPIAMDpdrndLfa4g352YYaNOZf+lnq
	oRDujg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9eyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08be1c84so8980105ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981830; x=1795586630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=Q7W+jj9Q3RbdGoHtjsaHSx/z+2yqQPyx+sP7JbIPIZpoI8tt2zpf7qBgLySkFLXyGG
         f4CUf1JnvKIwY7ourblEl9uIlFsKgaSR8OMxpOhIZjm4iBlj0/YuY/q3mIXWRYTU65Cm
         0Dzts+gANeaF3iTlniRd3Ct1RrskS6slN5/kGponlgRSykVlwKMJJmqNfMngx028vVT4
         x8fyM/gcf5ETmiK7Mx/UT5hlFSXFmNNpOWqpweCq/zpDD/qKR3/LBQPTibhETRG0/U8s
         4zQFbk+iD8UiCjtdt/dufB8eGiJsi8qMF8H/Y21H04la3MShbF2+ITlAT3Fg6hyiC8gA
         4w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981830; x=1795586630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=jM0RddGcAXh7ek/U/eR2O0FBvEdrbYdqa+F+uQdTPk+B5YO0aiMm2wmFIm/Sj5OAdd
         OAool47JSUDwK4/v9ewQ1oaPUjMlqKUZFIw7tWlCQyI+1fDZyA0wwIsqhOhJQ9xqMp/b
         GeRaRfSqm89C7bXEZn2DWdR8Vj/hcU8reRP0x13j600cQlPMK8IX+HoGPxO8pM40U1Oc
         niJL+Szcmk9SYRJAx2I4VWxbzmmcooOVvrWgOuOVf1BxTw/bD+mL3p9hTamQvgi4g0ek
         T9uPssrm+KD61SKkphMgj7+/JiMEiI28O1ZEOTXmKzxXmOl4seyDKTgbFctTAeKVxmJu
         a7jg==
X-Forwarded-Encrypted: i=1; AL+hErG54L5ZooRvnUe9HVpM/K2keOUntZIHtfGJFxW9wmOek2HKOhmgD0jFQqh+/qhP7NH8uTUEh3z79HCUkO0p@vger.kernel.org
X-Gm-Message-State: APuU4Z813hGCCFvbBSj6y+Z9b8Dp4xVL16oi3VBmP/3D3vgSMo82sZJi
	koQO5igy0ZaWVKoFUsGeksXiJIVQcsyiAyXxLTRgnbM7QSCdqgQp5H5Rj33yryDZyD2gsHtbZ05
	YKZCopP00dH5XhtBkpe139OTg92lXqDl7Oxfj8sO0dcG7Pqg/um+Ek0KbttmxZvYJQON7
X-Gm-Gg: AZFdTZetFsLawhe6bMbA5HajgtS2c6kr6bk0xNQsAcOd1skqt9d19qbPl92LSubDo/R
	AG+EHt5QwOG42SfpY5P+tRRx+Lb3/XfXsUGPq3cHgwhALpwFSrTOPrzK2b7SL9AVJATGoKUfo0Y
	BZefw7Q4HNeSYHQJ52WIeF+gQNu7iNku3NsvHV8Jh5+eWp1AkQ7WzQL10xG7lmr+Voc50GKKzCV
	1s8jZxDlRg/FrmFPQ1yobNqCWz7HEJu1tM7pn9UeMcrt7L33r9IrAFJLPPtNc4futK7nAa7H4ty
	B7c/LARvmPMUe6/3/c2g6/8fsgaCIddSRKvh6S7bxc9OCk0QsMq8HLSx58pZJxdGu7mquKTauSF
	GPNPDUQivEiV2B2PU/i3nXkf4L8uRh48sC+sJ8171+b28VjdVWg2P40u8CUxzRE4FRvbUsc/oog
	==
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550535ad.61.1794981829969;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550345ad.61.1794981829476;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:42 +0530
Subject: [PATCH 11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: i3Qz6yHiuCtBZPQiHXKVBS2PGCke9WjE
X-Proofpoint-ORIG-GUID: i3Qz6yHiuCtBZPQiHXKVBS2PGCke9WjE
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd3fc6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX0xcEP46YmTIb
 Us08lLd6qRIn+GhzJrDPFxgJ1fHS1BUl6uLESo00GImPO1rXRzsKoesXXSoRAr3eUOzQpTKmbtL
 F6/fkfr6VBEkT/kljfwIbB8hMCnCtgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3kHEgr5S7b7G
 CTFaB4HSCvZ6CwSkHUC33cWrvD3LELQLZogaTHbMLgLA+YBceKFu5xu6rms5AZKppLF41TOexnw
 XWTKcvdPglE91c7n6NIe26mk1Pdxs0f5+AxYatb6oCqkADbRqTwCBDkMmsdxyMzJvJKnoBFHJxk
 04IzaHLVXeA6U25xZFd6/clQhi616/rDAV7i3sHe6F3NNiKQ6raZoh1Qg1iUXsi46fkVtzhvcip
 6dk2r8OoepQAEf9nbs0fkKkl2jroFPNeET1686q9HZiur70pTOtyoEB88ZmpDh5s9vNFEgfBV6o
 drRNcwz9YqRirDzg47gXKBc0+/VI7uTT6VbVCaX8ysxBZACJE5Cw7BVMkOAR4qfhgeTkNgpoehQ
 SZdhlLqR2MG3mfK7nYx9l9o3kmr2jEqC4Mki5Vqu7eciuXR7DoIFzCrsYI4/PL7cMpxzR7sDGgD
 v0JoEd+IBeYeQXyiotA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Kaanapali TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index ea7d4768483df5a3b5b8fa85a686cb9f8192e673..c9406a9ddfc54746da2b38ea1f02fd117a472c5c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
                 mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,

-- 
2.34.1

