Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7319041CB31
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572550; cv=none; b=uxRtoLIdywGbqXU74rzxwpeiVg1A2ldKahuKEoDkWUhpNoRdsmsquES2UDArM22sSV5vjBOzoSrFYG7/mZynfU39gKaGLVB9svwt07w4FoJa2TEuU2AF44Xx0nzeCu+aBoJAA1biZOo4148aL3BGn7GqosCPNmS5XP8aNg80ml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572550; c=relaxed/simple;
	bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8VhMu0iRFIMsVkMVnG9BoI41QmBtArgbaW/5TrGEmCwc0xtMJ/XmH5frsDHoGNVoFO31dSdySO9CK1HZfD3YbT6GLVPcE1wySQkzHqMuMrUHnpdH8pZPuzO7ehFFKgZYwLGxjIv0xU8ug7M+UCL/qJWXUDh68DzcSH04+DlXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCcpCEH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9wszBf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCcpCEH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9wszBf6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdL13194980
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=; b=iCcpCEH+Hu+wpz6n
	wkP2FgB/T+nSWiILXcNcFfwywiWQMMXEQ1o/MMpoH/xx9jZ9/BwztI1pv+ZK5L6i
	YTmrBnIR/O/kGlUwAxh2bfs9q+CPxSaR96qFuklAQJwX0wU4kw6yzsaXfNdtZ+0I
	yjjz1v//qNKw5ookBYsd3pIqVUH3rAm5r3Yww/n1Bk/Q+3XbFslArVUXjEMSvDxe
	CaPjlkLtC37aH74hQxTjAgcG6sdCHoEuslKKW8nG1ZU709Jo1AzPxfwtXjuHVrX/
	5zGciuFP4Khy8HEWXpykjgnSn1DkmoNuBOHztX83Vl8kIIOyoJ4OBWA7EqkXWYB+
	pnb0Jw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so45622541cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572548; x=1788177348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=U9wszBf6PfC101JPRH6SVwhQiq0Fkt0+pbooqhosGsWE+k5czbFVas83k4SmpiNDfy
         J6ibuX3+JY4GSo+x8HSJxEUVn4Ox5kDwXzM/52/sKOVWAJhXFAxeKv8kjPx529Tm5hbj
         +xjI+4jHoZPuWmISrhbxde6cgKLNRF/0r32o26zhtsxixu5CptdaWm+p9doKGncv/0/Q
         TXGPCksTbJTPZ5Smzvmt7jtYzQAFPWf9zjOkDhEx6oXHfUaUO6ZleFfdZBOaPe1iOpid
         gGDrfr37AdFvVaGQZ+DwTGJrtGSmI2w5cKdk9UnIphp7t9MEGzHDs1djxZdiRI3H5WH6
         TcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572548; x=1788177348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=s3zZUIil7gl9oV6xt00Vuw53GoWe5mLdZQ7q7MloRTIiug6Yukm+iIgSzFp4cjXedu
         RQEi/Ffk6VMvBB6kP9EFtbK/jUQPsXXiEnCk0DeFGTf/8mAJQGF0JaLor1F1FO5Yhx9n
         I1GYGmyeJt/I3ArnGtKlqGGGQf6aq4Wsakjb1ropOdJhJVVTpvW9PtLtKK8zfOTAe3KF
         WweIcCUcZxxqPc/KcGOBwo6M+DWs1Izy3LGmUcN0KHEIjNlKbksYCo+5FJKNHNafufl1
         S8RxWZM9fsWCjuupvoSP+ZEab0lOj+N7TOyLSsDkJcKA/BPi9AtTfIBDpvt6B4P1NBU3
         Rz7A==
X-Gm-Message-State: AFuF++k1KnOEYwLNboZ+f8SAdJS8orj9auxzAXjXBkho6XIabsEX+jp9
	RyKTy5JStADJvi2hGwhIQylaWeHGrfwNf6oVpSX0Nl4r4JJ9FW4PfCQfxaKMfQ46eXsodTfaguZ
	17T6LqrBt6n414THYx3TkMf8AfU7qNmGtC6BWJvqjtw4RtZE1ANvFab3HoO1knZAcG4qE
X-Gm-Gg: AR+sD13FbPKZ3uqHdR5aSU5flI46L1ep1eDDLLTiT6n/Klrd2iZyajKj0vXvAJIU1of
	nSjyjE7CaqHQdh/9B45t0APiBVUNn7GAMwpunGOscfRAQaeKP6X4w4psOlg7ryc4eDvSLJn12pf
	SZWB7TLhtceS7jZo1BPUQN+my/OUXey+gB8ahw8OSnwvVyvxqbDhbieqboFSrTPfeIFqH7Q9p9f
	BSy6GftOav3p5KrI/WA2Q2zIA/M+zQjFVfFqsISpFS4nhm8k8NtsndiOLoFbVrqPXB57PGwJR79
	gY7BpUukFG9owFu+p1K+QLtHvrzhaSqdn1IOBNgNWQtvRKD8mmkyIXe9w3f1ei2NePRSnQzk26n
	RZ7dw2ARQ
X-Received: by 2002:a05:622a:118d:b0:51c:c6c:9d65 with SMTP id d75a77b69052e-52df56e112amr227060231cf.1.1787572547651;
        Mon, 24 Aug 2026 04:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:118d:b0:51c:c6c:9d65 with SMTP id d75a77b69052e-52df56e112amr227059721cf.1.1787572547075;
        Mon, 24 Aug 2026 04:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:07 +0300
Subject: [PATCH v3 20/47] clk: qcom: gcc-sdm845: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-20-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDoqGOjM4M/KdfqR+TXX8+XA7qU6PhnY0DlV
 +jnMZKT6h2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6AAKCRAbX0TJAJUV
 VvWlEACjp0NZ6VdXl05mtX4sV4htU/1OC1a5piEj0qvvlNvS/HpumKxzpT5LruehcOSO5MJWcjT
 OE5ceZF/GwvmDolkS0jQmNZZmY2zHgKXiHQusBSHKBqYG5v7IYaZtgqnZXnCptPPmsJJspNeGUm
 54uZp49K7NK8VH3bIFXnW6Ddgo7334xYErmWiem31JqDN8rVbUfSqff67YLFe+eMxomrZZvUwSz
 +BCYu/eD5e5eVqyvLhKtfHTBXw/ra9XRTUDl7T1IJOyB69cP6U6AtvoJk3qiMenn6UMLpWfJwTc
 D4ACQ10SSxbBnhp1QRsnDW8WzJbOqnkMj3D+xOg+zFdr+btGqbZ1CH6+zTChQvhVsKVKXA6y18r
 5abxtrR7YNtmPr9o+aV06x+JYajZsuEMJLLVh+Z03Wir1DO9uRTBZIKxDC+FAEqt0ppPAl46J7B
 5StEroBhkuTqOaKeCqUVZRIH/ab4N7i3EUDMyvlncLnNNQgWtnhTb5No9LPcOrG0EGoYfsCYUW1
 qeFDZOaTeMmFzr1OvryQYnsiyTcnGf/afBx6XrIcKFBe51UmUuLo2QgQjsddSfWFkEC9zkGoDbi
 b5qswItqXXHy4mgap3hma6ZkQxsLmEVE2Kc/n16u+5eSC3bZLV4MvN1z8rRUsQr26MSCnJCM/5Q
 LTTgM9du13NkI4w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX4MBGUMfNXJI7
 vfdjDJye+sOMEHbmEw0vOtBCIpWmkHAqjSp8Ah6qbOWWttvFSjGA73WyOmzNQjJ9nbRI6PrQUpn
 9XvuVCtRDh2mzo8nQ9uqWCfUDOujvgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzdEx5c5qFrVl
 bxVGuPHvkM2t6N+SmSaHINKIQIRfZWblTnQL/mxp/TdAWjn3ZolkDJqUmPLYfhAsENQqYGx7D6n
 pXZ2AViFjspuh12ORb0Guj0HXMQOuy2ZMWSr72Pqq7RoxYRAYN9MiPAM2jjQ8COfCR/JNgyQAXL
 LrliFyw5hHzC3B+RS5sN4QZY/Ec4FCxX8NREdpkdHZy4nueFxtRiGTUUTnjMnzItPAqGz/kRRog
 +8JyS+q2K2z8apzUfqH0LH02mqXqdCWdYDWtd3SB+BX0tZqey7rrXjXAzrMV6mi90vI7hOiC0TD
 xvsp6hFuTksrmCq2rMA1+YgVOI43XlD/cdZkUXT6ygNFVpAknkUgBU988IiOefDR4tLf5XXxbYp
 ZqaHRPiyrAPYyZazjmG0Bv1n6HVTSCKQ38suastj/A4WlFzSLg86r8Eyz7nogGbkSxH4y1Ayc3Y
 h5oiNnWsp2FDSSCQEGg==
X-Proofpoint-ORIG-GUID: bKorC8E8gC_bNdb0qqiroleB1a4fo0_z
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3144 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bKorC8E8gC_bNdb0qqiroleB1a4fo0_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 57d54b45fa52..cde863dcf185 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm845_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm845_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdm845_match_table[] = {

-- 
2.54.0

