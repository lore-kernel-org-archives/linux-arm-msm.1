Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841169;
	b=LxMvq0GdxQPb8iWa4lC5l4bGKhiFRzu7yyKsza06PvxayfcFKb94ZizlVOCjjOUZsH4j
	 5X4uWSrB9zgEmPX3M8eKWU2Yvcajsi5/zE9QJaN2NxpqZ2tNe4WzvSOiWhgBV4dMDx/Wh
	 tvMf2FEAn8S/F4TouJHP15lK566yxDc3fqNe3AOCFFHQlQZDnLMfZ02o3O8cRaixX8bPV
	 FzFhjSHIYYM4wYPaw9JjiPio16OZ/uMdPisXe3O/SKtO1Iq1vUC1mQxUHVXbzQZgUp1JP
	 HYf51G9ruZI83kl1MzcEQ5zqvSW2e/3cOxRQmEtKnLknc6WCQdY9WNTttmBBplVvteQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
	b=Nslip+DC1RrG6OrbW7eeRyjb5SgwoeYuK/S/ikjPxUBgEmA3DJztbcga0VAOSq3Ba/7J
	 UiReEU21mM2d3KYRQIxblT/DitGl+ovS+xyAaeoNn8oMOosyopvEhnigbOrmW9DtjIkoI
	 sWAGVFBzmKCA503nonr6cvh4FqQf6VnbA0jjYLuQHhwazxgdUZdhbQudPCEtDzpglyHHS
	 jbMPivktoU58q1IgKXxv0p0OlxtrYZbBc6XY7rsrZEMSUdy4h87JQFX6EW2j3qkznXTqP
	 RHK9mVKgZVBgpCzIiA2WO/7cbFEQ/WVh8WcWxSZL19mth5vrtCGjw0iEcuONxvfaHGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42829606A884
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42829606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrbkp1727406
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=bOLB7abM4jkAfiKf
	yGiF+Cx5NxsP0yPKDepANS4vsPwZqW0hSOkhqfTAlydmEeeOTeOEIHWXYj/B3NZ1
	7xT4h4Jhv2TX+aW2ZLtXc+G8Q4prBJ2v29xIv+pEXWiVOKkAa11Gy0Q2d6POvW68
	pcvWKiYCyT2wry47Pc9qetrNxT6RHvB3NIb/wvX9vSy4Qg6aIRsnlTrAcXhmqhhX
	+RZm1LEkiVlgBDRABJcHRnJQrXac/8XGrOzMfuiMl/MIdkNqS3jN25IZKcF5pJcO
	pwEtMimM2GvoZTNaInvy58ZD31B7lTDWtBa8Gp3SUMMxgXfGNdV64J8rn48YGFli
	spjZzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqh1bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so1924260e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841166; x=1795445966; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=ZYLPIDX8EioUNa+jjzCWaM4+GqCQkWeYgNnsiIpR6GuovoeMUEgDGhc61wJWWKeRQe
         /dYRB6wE4lPSHjsFEG1CzVLFNk0DgFJnr0jM8hKrOrsULJ+G0i6JC35+TBBY6vsa9QKo
         agNoJwVDh1ZZdLaURkMjyfzw4ZF4+mjzTqioYvZl9ZsHh5tZtHNyxLAinyJ2i45MOh8F
         0TjT9lZrDrId3fFtZgTDYobUtccdCQ04cA+nKVNjSFiH86Fifil3oPZ3SoyQ/P7GJ/qD
         fEFu04T09Tz+vKissZsC31y9vd9qqfvtwV3XRe5QHy5gbWmGM2VyUN2wxG31jdutDZz8
         q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841166; x=1795445966;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=wC7CG+1jbVF/vLGw86hK/5xK0j0KFXk0sltUV52lNMkOC0Ul7LuddJFEqInPxWdYew
         NPEHaTk0B30AvGXHZoMHDkyHOFyn4Nh8ufJSNSOQay1KAJAPxsB7+Eo3tvGFuf+E9ese
         GnEWjXJZ9+EyBS8Fv2r3TIbQAZFtH2HIWuWpHXsdYqtPbX29FIRx1uP55HxuMMvn5M0U
         aARCY77rTO1Ysf6+0ZNArrNn+pq9xcAGJRXm+bx20Vd7tnHlbMyziZAt2mTuUWHJCz2d
         qhQSV+2JYfoFS491BNRIihjO/Vjb+zcPdsZsB5QE7fknNn0zMVWbnKni361UkDADhYQw
         F6lA==
X-Forwarded-Encrypted: i=1; AL+hErExkFaNqRRN5DUYRunSd84Dl2yqEYCe9+ZcbcZ10o1gvxQ5pm3qQOfjJpqsZw2E4eiSch7JAYg5GjQEQqqs@vger.kernel.org
X-Gm-Message-State: APuU4Z8SoTZJFVfAeEs0G8FcEb/WqfbKiuRDK2mzW5ScCQfffrFqFlWm
	26d3u5zfk/2MgefhwPP3Z21+rRfjSXd5kVJJb2JRUQ8UtVz4x6gA1EHIc8FkyZrVh4gyd/ZfhdB
	VtL8nf6PlmWlzKy9oO9HkrQp0qylFAyYRYO1MLmnL9fHpF011P5z/q2JUWJH89dwDcw3g
X-Gm-Gg: AYBFou03mdvUR4elpVlFZYFCB9FXloFdAQazlzfzkQZ4kDOvlTwCy7yEYo6Nfp+eo1A
	SHw5l5wQEjwl7puIzgwbMK5GAeTWYwlGmxVvM5Qje11C6MnzG0S6ii1hc2cXZodpr45IFNNpTX7
	fbzxKNXvq0nTXD1rtiBBz5wT3vh/AoyWsw+oyJCEe9mBV3hfa0xydyVG+p8HLev/HhdHB13lDT+
	gA9zuYdxGq/KDMQsYApgiF0IvfTTWWf6nI3iPHsEpF+dkvucnIBCFMp+tVIdLNPhFEgI/XKuJsm
	P2I8z3NuVjerx/25pipj72Pxwq5iarogCd4lVbSXTPMJ2uPnxVc3YaQsbOrN8NGTID8gcrtEeLQ
	IGaPEMF9DicuKR0vBe10Fedpb1ujC0byV2buMO2kPC1CCKmNdOvPtEqGNG/5i3NmlQCNteG1Mh3
	dAsqayFs6pTylGBQ==
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604782137.30.1794841166402;
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604763137.30.1794841165909;
        Mon, 16 Nov 2026 06:59:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:24 -0800 (PST)
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to
 assign a unique node id
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115880.1191469.6312889000780599157.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=2289;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=tfSyqr/JVICb+gJ8r7i4p9ZH7pgvqyq8dvPpEHT6sQM=;
 b=kD/xci+qoKdonWMirYRCjPRULCCHqoSo3t+/4LvbeHgPxyp3K1S2tDB5PInEh8mC6gkvdMqN/
 gYgFqDd2UsiDqfjgXDQNm4LLbrHrVFLoTUJYNFudBj58U9gOKZBgCZa
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb1a4f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dTT1UR66QJk1rbgP68A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: qUqosnSAxT-zSYEp61paznzqIaCwrPxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX580bBMreP9fA
 fIdk0zShufMCLQcEbCWwrrQOUUzi5ehgdDuQ6BLH9xWGejRXNSd+iG54XlIMow+gvrxLnUOwC6x
 Nui9UcJFOUPiUg9h2IA/2Y2WKcVFCsIUSCBDEuB+pRMj7SQ3PFi4R4mik3zmqlJkNX6wu6pdSmU
 0mFKfcIyk2s8Ofli6YikFK+Vg3Rihnj8paY6gQ6ZgyVPrxzXeyXqnBLClpIgqfejnefTCBfdluM
 L6WrQhjM+NceXQ6l67f5kVhr7FcxNNL0xxJMSFtk5pzYfEq5Dv9FO3PR+tGLyJvCbxdVbVzQ7q3
 1gxDrQRy5cjOlaaeWt3Np3mGdPqt3IUVmI580GdwI4lIf1IGgZ23jUqzwP5Z0ZIXD0s8Cgft6eo
 0OhvHOzEHtIvX5saaVFwqlZEbRMIFpTZ83b7Gq7gjr8LC8HGWM4uUxCkkRKQ5iReOHBLY5YjCqN
 sy7gxsf1eLh3VORtOCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX2W53wqQQoqik
 Y3C2mSHcU02hTnN7zODTdh3vCzA39mOX8C4dasu0q5SQBTnMXZV1Jz5rbHSNtBhOKw3mkbJcCLZ
 XoyhIW26vCcuundaxMRHC9nQ6JENqqI=
X-Proofpoint-GUID: qUqosnSAxT-zSYEp61paznzqIaCwrPxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
