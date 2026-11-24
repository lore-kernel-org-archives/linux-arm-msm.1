Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517620;
	b=HwqUhbJvmldq007sKGkDgv8/ofzs7zlp+8pC0h9HoThbZ2CgX84gAk609MRK3bUD7xEV
	 rpu7CzdyfkFK1wXnECVXkdXJuB3jeKw6j7rEsL9YvJnKoEStCBBEorCwmYgjmcsol/g/N
	 y3XUX88xNaZ7hid1jFrQ/9o72g1P9C5ihTCVdA8srIeVMZo0cJFF/az+Nw5MXz3T/DaHh
	 zwSe/UK8nhwnyk/JbYdihbtgW3nrRd5UIix7/DDOMCj4nGMwOS2rotyLa1nWHsLX1dKbm
	 +AAVYJtRp3lqM2oltGhZcVxYMeNBK8A5+E0aNpVEWtlVimjhLo5Tx6seOtJoptCEphg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
	b=jyDVUUnehT242/Nw3CoL3scnqUpnIMKqA48GjeZv5VOwUgUS6+zSFb/OK/UZZUzmSf/s
	 TY6R6BjOcDYu/aEXDAN64UYop5v2xWmDNFu6nOSS/VBbmJJopOdR1ok3Kwr0jg3XbA/tA
	 nySkqGApYB5as4t+87OcfOEQCa9t+Xkukjj3Oj9EK1lrzCFGm4yATHrOHL7tR499LPUK+
	 wFfJUTmTIuUTjxutXOBOU4mbs6diIhtwmvRfmtwBS9JY7XWn3MS0rrjdHfJHQ0fi6kKqk
	 Y0Z0YU0rxwNoRyk3TgfvTkR8x6kpt2oDD/YH4yU5R8LBbPaK0CnR6Tr1CGxuNmeHKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WsAb/cfV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906DC606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906DC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAMMolDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsAb/cfV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8qcYL1598249
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNat
	iFAzBlmg=; b=QAMMolDcSlBSXYPRXycbXn72xsh45SeMp9zkjEsf17Py/1b5jXX
	bZlNVlbeU1zTTQKX9qdxBpVczc6wxW7fCYwxq/X7PQ56Y/HFee7Tey+86owdoELK
	b9YrfvS3F+k2cTD1wPM2h3QI5O+CcW0hkfC89rVputG7U15mmO4hTJW7jc1kHARo
	cKdva5O1j8GbpipnYkVmYDtyaOPlWtG0rIY0Rr9wjvFIShQ2g4coqN1WRoPCCWd6
	jfP3uuWZ4xku48e9Ep9wpzzd/rq1osKwhm0OqP2SdtzHx5LExTgkvGDc8HZAMHIj
	6c1+IZ+ZBA2/q9t90/J3bEhkCKxaZnnENxA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk7x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so4904202c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517617; x=1796122417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=WsAb/cfVGGUCGnHNOF9xDMI34rlKwEiRNIyQPPP7S2bxTjxDQFjKRJvzeyYlfO6gGT
         CGOU73ieSRjf49oSgiJzslxpwdqSZ0vqEKBG71Zc8V9l0ny1Ojt1S4QnfsVpSUIGIpEm
         vCa16Q9xADqfvq9byxrgBTebhJt3evd7tGppNHU+aOORSmYPVxWqMe+sGCFVoZR2ldtn
         eZJpw97jodJbjNQrfPuMNf8N62HgW37dBl9T3Ebg/XFpzygfqRQHG7WQxatefvUYhB1e
         jIcdkN0Bic05KPJ7UVIdoMwZh3BWhy0w3KBbOSODRyaDaM1mAMaWgO4+e1ngZVVHUb27
         qN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517617; x=1796122417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOUUZx0CdtYKdqp1+EXJxk1WGWW/wxGKNatiFAzBlmg=;
        b=lz7pPBgws/xLmNJNq37BUpqQA5xnqRIAEvSaEaWTNvDjjOn8pWT3/22llEFglCnBtq
         ZIZnbOjrG1k+TnG72i2igYO+aq5QGK1kZV4e3fThIanGYpdsekNDmXjJ9RXT2Yc8hxyk
         Qb28rkgE++jj6JJEu3A3BYxc3DlL8VFEprZv0GOUe27qy8hMjTkXLxbo6nCWPfmAOiOo
         vpOAj3M/BseZxxvbgCYU5um31dKLDUq1gaa+h8Da/4+LmV7O05l8eLus0k0zyYuGNqHI
         enRpUpmZOCVBvko5bSwcLpbKcnIz7fpHwY6CDZzK55CHFCJKGLYkjRqYWJE0Tr1RLrJ8
         QKrg==
X-Gm-Message-State: APuU4Z9qCyUTF3xjb3NGHMLbsfh/ulEdOw4qFJyU8C//7UFuHBImPVpT
	0okPS9ZWbxJYcApJx+lpfzAiTrFsoPA8bO+o7n3pDGc3D28Un+xIjScwIjoChdcQHIOCp8mYTS3
	rvouteROhifiTerkLEwAHguamyV5B55AlRiaFM4sx7CdLZ06DHUKSziIE7z4JIvIugggZ
X-Gm-Gg: AZFdTZeSTLwdKnPrpFfIlHSQiZ+FGw6VDNKzDo+ARthNVWyxeHGosf2VJKUweBESW8+
	wCErC93pKPdG+9ZD8YFdmypK52rRcR48O71sBn71IGEjmP03kd4vmT+lsROfSRyHnCLk/cL6bOc
	sO/WP6pf97r2pV22I3HzuY9dQPooPYCdUtXREBEGhKBbSfTMWEJYMF/l9fnSbygPi/9NZoCOpvG
	wtuVQsSTE9rb8TAWXHwWBoI0PReKZQUvHAn9WjIPu9nn9vsRO6Y37b5GSDaL2j7aXv7ei1Ygu6X
	muxEImtYrwGap5xZoyaFNl2XP+hp3Z5g2pL9ozRP3IFKmca8eiy7kxRink2FiPjRDKywbTxicq/
	vifFKXqe8waKi+wt9krS1DDz7izz8q2zwMO/Tc3rqh7xi6YphvvJDayBN4KOQCvPXqIHJexlDzQ
	GTekxqoaaWTRpaga+yGCXbQJ/5WHmygY389eTmFUj3doHfg62GG98aicsL
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405127c88.38.1795517617314;
        Tue, 24 Nov 2026 02:53:37 -0800 (PST)
X-Received: by 2002:a05:7022:ea8a:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b5569050demr14405102c88.38.1795517616783;
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm33732659c88.15.2026.11.24.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:36 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca IPCC compatible
Date: Tue, 24 Nov 2026 16:23:20 +0530
Message-ID: <1a2010d7c4f4ae5d4629d2709157d7d47c20b3ea.1795517600.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b056cb2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4wEsUtwOBY8d
 Q4FEB8SSIt470X+IAj+D1g5olPQYRXF7+Nv7BZLApB9tNQ2DuK/gtrEzeOojNeLdqqyRTnMKAGQ
 jQQZOQgoJUAXMM1PtBrn8BYddmX5DSXrB1ETeRWdsi2rX2e1GwKliN4jHPg0xD+yz2YLL+s4YfS
 rDpdfngo4hpJQ1WjRbFnvQsiQey7l69DTn4hro0Chk6bB7xrVlxrc4yvZdGhpEfhqqR92PZCIPL
 91nZih0LNSRLlicai3KeR/eUVeOoNKrSP2YbV7PdywMArP7qBz0RA11Bux2TUo5OdW4asqKxwsk
 7qV86U5piLmxAKqefbVHHEtHwQLSCFuq5jSeTOZabFOYvXZchRnx3ywMn8mMW9jMbQy2OBkYO5d
 M1Gr0WgjxyNNn2HCSP0Ja+nfXg9q7bW5AUofdNuK20Q5i/otPwaQLCj1lY7LzlJo6NBCkts/4Be
 TXIUhnWaCnC++oMfq9g==
X-Proofpoint-GUID: 4wMQCfgM26a9CBTci8zSAtoXVidxnD2e
X-Proofpoint-ORIG-GUID: 4wMQCfgM26a9CBTci8zSAtoXVidxnD2e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+YxGpCCyhRXu
 9lyRDWzsAOXf9rBJDbtQAkr6Q3xQ4rvQNPxPh/fa4CuQkiR6VyBIvCxV/ZN0iK863H9q+0SJeFm
 D02X6m414LbfwYildm/uCUeCvEnr3BI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-ipcc compatible string for the Inter-Processor
Communication Controller in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index a378fe8c7148..5734ac79024b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
           - qcom,sdx75-ipcc
+          - qcom,seca-ipcc
           - qcom,sm6350-ipcc
           - qcom,sm6375-ipcc
           - qcom,sm8250-ipcc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

