Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699477;
	b=K9AmqdLST6MavzjRFi8dMMsDAkhYumG58OudU9TNDkBO2sZNwJygxNhb2H7t51t82GWG
	 dxOVU0fDskLQAK8/sUxuNLxFtyuSm0mkqHMQiZ2eDfYb9JCRMPISLsowTq6kzFHdoLPKC
	 6gG5vQWPxZ+Dl/3q3N0SDnwcYZ/zCxQCjfttcRusQW83q1XBra3IGbukiBZuoRiVyofvw
	 F6pvzxzfk+7ERhXHm2y6JL8A3B0/bu2FxufNVSUNz+JOBjZSGk9JC8Z4XNGphPXOEBfsN
	 H5+jEvQSKRrsDF5B+XCsHrSdN9nf5hq8Bk93Q57Hu3VXEPWpquN7J9cteEnZbZFE6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
	b=s9P3FXo7AI8WPzapoOFwultw8tsXPZmvvKyuVx1r/B4/Ms2JXN8iF3ozAEL7LQd619bz
	 F0pkERlcOyMfB4u/5QzCzeKkBN/IDMcmHFoGgMXZuGfBGO6ihKDk454RB9GoMpyXk3wUd
	 VS8wwQupTIVPB2dD9G4uYq0pm1mC339F/L9LZS/Ar5YCImNkVcrj7PBn0KjVqHXv7RSeb
	 z8s+qxA3KJra/u6+XyS4//SMl2oVsh8R/zhj8FAtKU4233rYiU+5xagWlCUu9knkbzJGk
	 9dHgUQXktGTDjctAD0gfRIzTkhhcLFEkFq8EikxshS4zYUI7yQZ7jJwTaatnlGlMAgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9B606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD9B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iTfhKrri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP2vHrOa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUqk2911800
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=; b=iTfhKrriCluy3bWn
	sBZpQkHHl+Hg399tLvEm25/XO7HlO4C+hKRNbyEHa5g2OSMvQBt/k4avk2Qkv/GS
	wEXpMF9Z4LgxyldeGf0n5cTvs/YDaDDYpqDL6V05PRk2kodZKfPdd9bfySK78zTp
	FUD+tmRL5QpbMle++YkPJtrxMxznMVMrYM2FrBXBnB54YuPnKPBoevidVszjAqWa
	ZPOFGeWMMc00U8MwOQ/tchUk6hxQBISiUCI5W4eWPB69fnP/M+RAtBoVO0GwnOxG
	5LNrofiGOPAM6IpsX3JvV/N97UHcc/psA2FPsIhrs3wdC93DGK2RgsV76DoSVb2g
	uykQRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02e50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso6126610a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699475; x=1796304275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=NP2vHrOaVqqzZ4j0vxmCrTUUkSUo4Tir5fdILX/NiN667db+3XPT8Dn91zx7BoUYOn
         y2PWiibfc4b3CX9+IEIcGwitIxbC1Xbk/Cg0SsQManf4zSlxhioCTlRZLtqJaIkASroQ
         3LwGSwyV2SfLhXrGIjRVyG0YOe4+3um91XNHG2a6GcMCsCAEhVB1yNi1Kdrt5e9HT0Qh
         iCEdM1Q4gp4N92YCB7yZUd5rnc4cUVCN98/nWE191H8/9JYyKpsUCreb10GPUzifwxlb
         fQCR2T0G4kflisLwI0aMJCyGwT147EBatzMDulJMgrwSwLHHOE/N7BpsgQEjxyfvuu7e
         0Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699475; x=1796304275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VwRyNMnAYfIHAxme1KJHNbS4HCkaIyWE51UFJW/WuI=;
        b=Ym6ow17/HTgfp4ZOJddUfVIJLchnEWUbudxiGIPNWKI7e1W48JtfGmHdIIaXqwFFFY
         1BTkfBorKQ3C7DsU2mIbG/bzEYuwZJxMczhyp98zg9rGb9bAVJv3EsG4k0GD0ACVrmRS
         kWuzXkDkFhIPoVi0N3AAz2ClcXpXCZ7poUsWoXB+muadMUOvh1uWDGGTktsrJCT3yJg/
         jWnz6I9+kXt/XVVp3Q16Vrv2kQADYpQIjsA9olyMsvkr6fW54CA2BNg5tXcUiJKIp8cc
         TVEbQtGEr+8p4yxlz0tGmonn0uRxyPdsv22mZ4vRDskmZF7fBg/AJfLcOhbnj1tOEAtU
         zwNg==
X-Gm-Message-State: APuU4Z94ahv9UDKulty74NOk1T0s/GFZvTHDJp3gufbz0kIdgs5HAlj0
	U8cmE5FDmzpY9jlwAJ9aXRetlRV7hTMQxx8Jy1LqNh4RYiiirAepQsOuy8tNDezK5Ng8REYsdZ6
	w0DZYaBLlt1RL/kj1G4XpvQOLWZ6bV0UUwzYY/BF1I2cAElCxvgrFqaBHn1fqCKvgOQ2y
X-Gm-Gg: AZFdTZcKWZOrabzEvtqkQ4VAgyK+Gf01N8/F11F3sCFSr9FJ5aQIUq2flm0rSJFrzv7
	V46Dq0qK+f8HRrU7XxAlC9yWt6WBwE6bXLHC3KZsXKPkUOk7GjLWunep2pVt+1bs4+t80r/jO53
	Wlk2U9BciJdjeXN9bSxLpqXCdY7I+uu4ilpcZSxRSYIxE+74sH0LZ/gaiXNsm9CpEBZOW38b891
	Av+EqbeeqyZByPig4EiEXBQTZlrj/HlpAG1UUdfRKzES+er11BEdMl/K5CfNzzb6eFtQt1jGwXL
	YLLeumlhS4JZuZaYRm2/dm/1M8M4tSXWUkcWnbqUgFdD2iuuvSGsyqfyDG3em7hlQj2TfBQInBR
	c3sreszv/dse3tRF+r4Pe/Uop1AV5wLHdLzGDZ+WtvgM+EDVKjKisGf6vrH4ccZcEk0EZhJIMhQ
	UbWL7+
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647071a91.23.1795699475330;
        Thu, 26 Nov 2026 05:24:35 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20647024a91.23.1795699474813;
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:34 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:19 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
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
Message-Id: <20261126-nord-iris-dts-v2-2-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=1022;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3f/TKIuHesYZU9TLZcTkUD4yAPks35/nwbxYhtbY9Ko=;
 b=bLgk9I8gxP9rgBQhX5TLRVkd0Eptf3ULvxcMDiBUL+h917XghBNAMYIV4pPJC9tZgw+ErEFXh
 S3iFXXA+LU5BUnejZei0rbtbSHV4Mymy5eOQLRyF5fbGUrPdRS3x+y7
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083314 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2Kdgl9tpF7yuq2k2qQQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FCubBVMz0dCrtlfQ7sCxu5cHQ_MS9BR0
X-Proofpoint-GUID: FCubBVMz0dCrtlfQ7sCxu5cHQ_MS9BR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX79r9QIJAst1N
 51Go2VNYYhenSb0l/Lpg1YpEgxzAxuK34CS2p49Z5z91xecvgvgmy8pzYLumoxES6U3KbHWshRd
 G/Iph2aq5jJH95kwByY/vds70DvPyrBEf1XEGTEgCR4wJgkKYvD3aYUuaIFUC549XXBf6R4XxWe
 cWeajGrZMZyYeVmUkECHfZzecqZgyt8/kZlkCwDLD4kNzwzRWn2PDunWzowoi/rFFZD8PojMxVW
 EDuZI7sHtH0cK3Yxm0aAvBiMzRwK4zoVY6SyIl2LZlh+hS54yoWJbvdWSCJOKd4KGDdEynpK1ch
 WYSm7iSgmkfB5nWT29U+D90YCdzlSno1O4Jpw1AdXWwmmwNP2kGIoUPexn0yTfiQ/2fFmTXmwvM
 /ZuHAjqPVYYON38rp5isKfSJ54ut9X7W7plZfk5Xd/HOY28w9jkr/OohIeUyKGQaFVdh/ej5L6L
 o2S2b8VkYhOjJ385RRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXzYBFY9fEzvmc
 M6O98qJ1wCQ1TLa0j8iBng5ByEqIWTLvyIpCnLpBXUYykEh/WNOtFAoNDntHcN2R3j9HQdVRdA+
 6j0HijwkfhgSqnRUxsgvx19KS2zEArw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 3f764069bf1b4..b31c30f460b7b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -464,6 +464,12 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &pcie_phy {
 	vdda-phy-a-supply = <&vreg_l6a_1p2>;
 	vdda-phy-b-supply = <&vreg_l4a_1p2>;

-- 
2.34.1

