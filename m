Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743831;
	b=H7BEU37cFo4bp6cD+LWe3vYlRSoMNqjvljp+FuU2SJF7JhE5+cc0fEvfHRKhANu4AIAu
	 Tu7VNet8AvPoqglBI+xFBmRBk4VDhqT3TzHCzNcQC5cQa0FFHCEK6rZyz7Q4lImGYj1gX
	 4iv7Qwj76ySBg/inVdtKDQzkcbssWZD/sn1yMvXmUQKwbNSVYoupZ5wqaYYIihLMzJCyS
	 lKbVXCrwlwZ/5xxZDY0wXfVNEuZKUFtSUkV142HddwJ1uAK7XMM2GugUt8wh2l25CkgVv
	 6UDHwN8Zha4208SJa0udSxVbSbZykUvMcABkLlbj00KRCGYoPviHGrN1Ibw3DPceGRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
	b=rC/OredPTERdQPDAiJUHcYEC1KPp2mKkINOPpNdGqgX3QhaEFS2fZIm9dNuG2haXGu6C
	 rXsxrItvkdgyJusU9MZNyXemekpeOcjVlh3qrNHmV9lKZQsy2w+uhBQ0C1L7c8mIBBXbc
	 dagk35ABz3O6UvboNMfKvxsoz6Gev7av+WIlwmZB2JecUu1dXwQd7ZJCdOiR42yMVeFbX
	 /wA+0YYafGTKaQWbwuX68usf/uw/CWApjgh1O1U02pIfHsnqUbi70XxXfTPvEimVKwSrr
	 GJCap2kKJoTUGq9eOs8r3ThkGMc16fmFVB9SvcqQz7WgoAaFQbb/XW7StO77jPXXZ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C8606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 22:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKjEa2395443
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 22:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0C
	GLMPxdd8=; b=a+E3TXTAtAfPkCzOzNlfiasq7aAxxHyXpI58AYJEdVKtjGrqi4V
	GRvVoAOuvZhfNw8SN3kyDG8v7zYlWN4rOibIzz851iyR/fcaJnjzRFVlVJcVcsAY
	rgHQeNnitb8gtUhGKTQlA2P5TFhqJo7p8A4dEaDoACsnrhc+Gvdbjo+ZBwAbFX+F
	ehXwxc1Q18SB6EvEW7tspcipqThEYe4PxU669F1NrIQwfJRc9g7iCU6zR+WJZiMK
	XsGL79VxonEHwYcx7oUOjTGLdqj5Pk9LGkB/PVBQ9EA0eZnU3jbO5Pd3e8UXyuLf
	HJyZBuxCNNkS9xhSVA2SAvQFAAE4SLABIFw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1pfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 22:10:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso312235c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743829; x=1794348629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=DC20Xwo9leZQo6LCS900ARLquIy+ZqenwhjOznEnP4SgI/nZZCDf7umtlpJ4CZ2k28
         GV3jMZxJs/xiWx1v1qVv31a63nOIGrrNcph5EDj72vGQ0kSva7cCiLublSAyTdQPrhpN
         tLfzL2DCuKREE6wrMcHkuEbyXWpLlTzxTeh6i/OcC9rXnAUVjwwsdn5jqFZCNfEpsR2L
         IGmkLcPDKEmDsyay+uqKbqxj9q/PCNIX+PsDXGLQ1IJ2cG67G3oS0kb7J8MFp2Jw8jLG
         eE4jY2Bf2zc5llimsjLUlTWg3CGbY/77qNXJ96PQc3bVfXl+IjqJf0Xn4yLy2PtFsVaQ
         SS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743829; x=1794348629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=DYbewT/JCOdHYyCnyhVHRdVoGb20zNVw4OBUvERqTsMxLbWw5Mf7MDwdPksWUhsl2h
         VVjz9z4AbJDH6cJ+ORhpcl1XVyRs6U1moHt9LERoqqEQ2LQS+kGY+BSgM06jaDIa5bjX
         1684xbvfsb/o8UJ6Y6jC4XbYjBp0vpmEts3KZEA99VcKaM92CvV2G2k/BsOmOIMI1jc1
         HBfopO3fs/ht12mPp4lSBherA61/oSfgz02fFfXdZLrlpdpYG26WATL+iXt2DTF/yGnD
         fr0eV704JAs8J429K6fkay5oJEG8meSq+1RxeW706yg7VB3PJQlLWQJE/97w8Qd8pHq5
         E5MA==
X-Forwarded-Encrypted: i=1; AKwUvBwuUlTOFEnP+ne85ZB37NEcY/JXO3zI+rd0Jzc8djMeR/kXeJYCUiD5WZD0LmJrX02kPZGYs6pIZQpwOqzv@vger.kernel.org
X-Gm-Message-State: APuU4Z84CQlvUISMsAKvgD8ZbUQo42xLt1nDvsrdNHo+kiVBeSIR2zEi
	5ACYKsRn0EFHtj4jNd14gtmt6fz4daMyDed8Heug3oN4tknlMY8C3hjKaoKvz763q5MoLSQ6PQr
	iS3itmALk5t+D0CDGzj0qSpOkzZDFZB9jmlLZMBNpcdKRXhh6+Xoo0zMzC6Vqx/X6is/r
X-Gm-Gg: AYBFou0R3/5cnPMDZ5w+K1W24dXdf694wzQ+GsKjAML6Z/Hdpi6bWrywDqQ1XymbqRo
	UeQzJ0/p8E5eJ6foevNktgT9GL/okAvCzEJlC9UJIvknR6ZdEXh9yyMxOQJlEVSL2GOQaldY0QR
	pZgewZqY/fq4RY2x/54h5aYuQO/PXzRAW628KnCp+4Envo5MkJK+4p2InWO/7tgCl3pNS6wB0Ug
	eFExXGsvX/S5pqs1ZtkgYmmD4fs3eZ+oBgyxapmbfX5HyaSP3UMyMI4CpdAGfCJGjDb0r/782aL
	e2Xno8SFA4rMzwz6L0XqEwcCRQ8mwcQl53z3jOSUtrDQQZcNTuEhFbab1OHgcLgtMrxOUK5hG8j
	IkZh1/Co63pIxPYNVlBy3aC18b2PgoyIg6YC//G/8WyMtWPUk0Bm9qygGvuvD5ynYRObWe1SyfN
	bg2yQaEWFCFAA32M5/0g7i+cvZ2a0i
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265700c88.14.1793743829083;
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265658c88.14.1793743828301;
        Tue, 03 Nov 2026 14:10:28 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:27 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Tue,  3 Nov 2026 14:10:23 -0800
Message-Id: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea5bd5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=75llkZfwqvS44bKgfqYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: xsoebFAzQGUFVCxa5yCddZxTOMHbuqrT
X-Proofpoint-ORIG-GUID: xsoebFAzQGUFVCxa5yCddZxTOMHbuqrT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX0zQniY4pgRH9
 0CWUUQ1s49O4UdJaDTMkmIjhyvT1sIZplIlMD8a8lstdCWKk3wsyQHq5g1JhxrmHT8OdwBH0mUV
 PhnXaysDi5YkjsuyqHRDJp7IB3SsXWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX8L6SMBytCiEd
 nOtRcs6P68jr4tA6n3fMsye2ZSgCc8yRYUn755+lAPYI+uLFwmckTnm9s09+2UXq0O1L5TLNb/+
 3J/M7FyVXiN1FNXIkxn/ek56LXx6vfSXCta6DCoKme2BcZ+d/4zzeaEjMTFWnR0lD8tKfiFgah9
 lliG9BhhnlzQ4CB666qkG8L2reeNyvfKF7/s4EJFdBtAsvVsGFGH6mqvTc/QynKPZnuFw20KOIs
 SWWdsysypb9d0+8McayrYX18V2C0MRbNq+Ew1J8kczMSt2RZEM3BAsbXdUlpt9L0ALd1nogjJcK
 ld6bbyx1dBOwYrGZSDMluG/AuOiknpb7CQ6aanerjpV20/H5s+Z7CKqWxYhY3y8RT3+oJzXtlXv
 kc5rSJeDXFOw8A/lQcnc3GQ1r4Og9vpXzxbAWkXCJUVXpIpqrQHNzZIwwdPWILDZWbBMuajT3wU
 3AhUHDoqTlo1a+Z5Pgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030088

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,SA8775P-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,QCS8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,SC7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced above and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 140 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 ++++++++++++++++++
 3 files changed, 426 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

