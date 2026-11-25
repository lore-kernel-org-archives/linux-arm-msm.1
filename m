Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565216;
	b=r3KVls1Bp1cO8glib6RhnxWcnThVMRuqN0GbykkTNtILru8WUet9myLLThuozaeHZDGe
	 0cpNF9FAKRuURV0dJQbpzzTXzlzUijO0vf4SbKrFcVDzZzR0oWi0sDJol/4UAfajwfFUj
	 AZrs34KIstKmvKBl8sdIkFoplGdVCF432HJZ24+SjuGn2+6BDpXTOLAmZUSwMGI+wQrsY
	 uHcTubxKKlGxVbBjVsoZmmBBx6kjjpBzZfCACvLOUI7menkVRv9L+Rr25wnkz11JXeUXu
	 djPKnleA8dDf4n6Hj6dur4AXH6aBNtzhwE9J+nRziJ6czijJNt8zu1IixlLMd+p3AbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
	b=KuIw2+KtZXJoyITla86Fp6nJM09aVvfB5LW2//PRbbRuK3/iAlHT5lgcgHyOKYj0H7xa
	 4iRVEvQ2HHWoeOSKxWh2BbwBXGjK8Up5TTcNW7hdHdVlRpoTYei8cNrDVEnZWIaYVPaPF
	 mfQ8rurIR369gv/hjx2ytSTNtasvHjD4G1B9/y0as1tdPoOTgU1YtbAnrSLuklpBxCx5J
	 YpQBoZDAhVnxnjJWmHCl7GCWvrJ7b1f82mbXd0exBCOMmL45oRPIdD9nBTDxhr8l1OMNi
	 ZYFst36+cOzXbW/l65gY7Ei1e7k/boGSh3kvIW9nkI6dJESEi2Bv/HExX58UEu5fJNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fri0xDPv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0oz6rRo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E996F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fri0xDPv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0oz6rRo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AONwE3j2728234
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=; b=Fri0xDPvMdwITMwp
	+bydIZrpDuNbf7OQkwNvzYyc2j+A400KekCCNNLYlY3tn17LNhJavm7QCq6q2CKG
	64MGxx97JdYg6mo83SeHkdktKVMkog40m9KPq0awR4Lq1d7raaU6/ReCC0ifMBfA
	tQzDPfBDeUCRfHwcY3yOehb5YO0X1/XhizX8ahhPlWL9qjSUppIGD0Ytvu3uOUNj
	2su0Y5Uu7kqV31GF49zCWfxpZHYXLagsSuOtQEGOG2b0cwjg6njngIdWbROQRV9g
	YgUazp6zU6Yi/aQl1putHweeh/QPHk5EVuOMfas63I2OYtAAM772LJRKkXB5xQ/A
	5p8SoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbg10u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso7037943eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565215; x=1796170015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
        b=H0oz6rRoJruOx7wG/qZcjxVV5PuYvGJk6+J8m1T1tQq4d3NFCOpcS9kQK+u9zzChMX
         4vVTotOvmskwVcCUO6Fv6SMIl45m7Hnd1C3iPfC/6WUVsOEUh8r4AKNJPqbJ+GneKYGh
         4yc2nlf50YVHGFMOW1R/gb5MuuwxftK364Nl5cJvIMotWHt/oNEZH+O6CtDKCbc9ATYV
         alFrwL2nCvSv2o0H3Ss8D+VfXrSn1Q7zMJd8U2cIyyEp6ZvHYfYU/8oHMlUR3Kp/ae4P
         c7EMSA/ycc8kjKLfgTj8jno27lXCLA+hOX/oEUQkiFqFBqQqBnvOXDv+Nvk2ZyHTWHQW
         8L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565215; x=1796170015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwclLV7cw7J/crM0GWJq1PEWnv/bEeY2FOqZV8eVA5M=;
        b=0nkRUw5vqSDZBP4X8Yq3LUSSghFAL7BiCYz9u3jlB2omi69+RhTyBw7FBCTL3u9M0q
         Erxu0p7eCNfbp2gVByiMCNAj72cx8/CRG1jcN+Q2x40NEeqoxu/ie0alx04OWPxOM7sw
         /0F7GRObg9kxEAro6mVzT/2xDRwHvfuAu928YoYHiGJQSbwIhGaSPHs5rBUv3xl9L7wp
         iwORcXxWRddBeEwabJqguWQcC7StFr6u6sU7Vu6Dagp1Qz59uDAjzmkh4cSFl3GiWI1o
         5FeTZzq12Dq/Ths4JRbIIV+ig5MpoYC/dnS1vchKHlAwSFc7e3X+/Ae0yPPlqGq8Dh3A
         F5kA==
X-Gm-Message-State: APuU4Z9Sq1Jo2CZCyZhVZZ/v1CEpE1tH0UyjdylS7SKBAKB5iAreX9NB
	3dmpeTp53rALmnq9+PU83sBGB2Rh1VDXXmVo3/4PF2BCmDewSZg9Xjp8220cm8rtO/LmziJDBJ3
	OqYh+vbTO2rgjOMOtC45qpajbLpdztMWYDqn1BQlVqyCsCahuEDgXLmgTdEtHQgBOxWIj
X-Gm-Gg: AZFdTZedTi6HiTo1id1Cx4F5x9DN2l71q54MjdqssTCeqSpkV4cQE9yobCmFX4bTyad
	V3W2LmCtFEQ6q5URU1NdQ8wwZx2hkYyyKj4ha4K56jgxTPeuASlgPy/5GNxGEp+5MzYnjIuPyD6
	meP+oKwII+WaElmZg07gW4laI338109cptkICEdC9AZbkOdBhK+E4jhFLWxR9k/zz9YODYniq08
	blbZn5bjZUnnzKErkgYxSlK7ya1H3fihc90lgSbIhrN/Fn7/OLdF8zRlrtxPZGTvZTGZMJuCvVl
	s7IIDKO9f391I22zroAPhLq5DXkwnFGaAz+MebcawDLlC0x5xTz0MKX6Cpq8KE+fvrJgDIvlaUA
	4lB3YDSvoVryifUGlTWvWUbf9erOVKJbA2a4FY4+2ANlNJgzxQUUYNFQ+Pg==
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr9602086eec.11.1795565214631;
        Tue, 24 Nov 2026 16:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:8953:20b0:386:a70b:75dc with SMTP id 5a478bee46e88-386a70b7837mr9602057eec.11.1795565213947;
        Tue, 24 Nov 2026 16:06:53 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:06:53 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 05:36:41 +0530
Subject: [PATCH 1/4] dt-bindings: misc: qcom,fastrpc: add hpass label
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
Message-Id: <20261125-fastrpc-hpass-support-v1-1-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX38vNc9ndx+JO
 9ul44g/BTd00L3hIy4xZuJTuP6Gz1B5pNHSKUMXFj2WWkZAmW+Jb9O6/QJi9eFJqlEFNjLcIjTe
 sif9uvFHKYFq9A6t/FZSUhn0L1UFEUs=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06269f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EyBXVfs1xlidXAZbQhwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX8+ld6KYxX7MF
 L/gf/2Cl9Hmn2GV2QWo2lYV6pDKLZVvKD8VMIcshWIxBtal6X1NzwXG8+j4YH/Xfh5fPKC/hxEY
 w5L1ZwmIjzFKc/mtOsBypez5Js9Iz2P6E+G0cbvgG2VeN5bruZatZLPH14dBO2JJJmL4uhWGImy
 klrJRw15SCZie8+V2zJsdtxBxud/AGANps/zTlJpVucE9HY02JwdNnlFZUhNqvrQlD+foFVBDOo
 Du3JzGhxa8jMo+SSPkhwIWrR2RxD5IYU6uwvRxEiHeJcNcK4wAElGJkHXmBA5SmJR7DA3yKvySh
 qSpvSLOq80SqSRVd6GqudC9kPkw3ufVC3Ji8BeQcGUqUcdyhQsdCA69SVq4BgXAr3jZqu8nBpIp
 s1GkL+MJw5KfV4MKVqm6XpZR/UxrL6d5MvnToa1zq4VuiWUXtsKxD94YZcLTmm3pQonRjkDAtAf
 j387D2RN5QqfZsZQJPg==
X-Proofpoint-ORIG-GUID: 48PeWxuAmJOrgOlbJDr_06kfPPJesP5P
X-Proofpoint-GUID: 48PeWxuAmJOrgOlbJDr_06kfPPJesP5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250000

Add "hpass" as a valid value for the fastrpc node "label" property so
that a fastrpc instance can be attached to the HPASS (High-Performance
Audio SubSystem) remote processor domain.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 6b6ad95d5cf4..a7f7504897a5 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -41,6 +41,7 @@ properties:
       - cdsp3
       - gdsp0
       - gdsp1
+      - hpass
 
   memory-region:
     maxItems: 1

-- 
2.34.1

