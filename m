Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D560445AE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385238; cv=none; b=LUCjsMTy0TguqHO2JrSf1iaQ0v3zhyd4JxlvPz/q/mBJkNYwuVaWNgUqour50c1s+9Z/5ftFUGUBAlODVV8He6xMW6RzSRNYpmwy8MTVqzL1jCIKMjn4XJpPGE4uDQTDMlU3VUi1Bfi2H6iT2OfxQKNe8h5nYb+yOk8EB9cLE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385238; c=relaxed/simple;
	bh=S3cHWu7xcUvy0eCh33hOcgT4RaUxYY6azMPOstL4lBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Jyhy490jfAHDElnttdX5djx3KWopZFsEE4rPQNnmVH2zls3qknwY3aVUYayhDozd4fCo0Bco0hDfX7nTC0OwBR0mMNag+nwsFAAwC5d3b7DyQZ6g8z1kaDvh2xmRT5g2U4N4mJly+98NIivRN3xArMYWmLYHIzEelgHmDz9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GosI7bja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkNG6nSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GosI7bja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkNG6nSn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm37G728445
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IJCHzSLhrd043XzsASUdlLLU
	ScQGc2AdK8sGqJtE+JM=; b=GosI7bjaYzMwzcEP8402h62t9XHfpySomYVO4Bqk
	fSybZG9pT8UqZyqVN5Me7TOq6m7Tj1XDBr0IwPwwxOQBrQSpygh7HhiomPQxsJ25
	63bazsxsFuhHZhd0wYAN7K3bZBRcbQJNzRS0/STG7Jj/jh3qoBEtyIzGP6SeNiT7
	lvFKvoUD+OUG7sQxVtMIW4FwO9Xeeibk7YXDf3F8tv3MmXavGokYQCUKvPK+qfBn
	ks8b6L071OKQJOKth2ahP5De8DtjA1LnWice1oB+PZx1dAwZGqUwUzx3e2/TkZ+5
	9/4eZv/TsdFWd/ka/EbDENFxef8EeGLiAi1isL2Uw0Ma5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rpcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:27:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a01d1d1b6so342571385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789385230; x=1789990030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=XkNG6nSnbIyG0mrmEUJgkhyYesi8N1V+DAFl8UwY7LBi5WWB8jowMfS1JXW43R3P5K
         5Al0xvCGFl5jIn4KNMV6qJkC/ME3fgf3n08GOacAwBox5VWk4/pQqag+XoWYzUvp/MJf
         t9ZpkMkwhNjcXVNi7R0EALX/o7FIun/6eaAqR5q/Fn7m57XB90yOKF84WhDW76wSfJ2c
         YgvyxpsIjlphj28Px7s5+g1oxMlKifL5x9MTI0UIpMjSpSbOP5NlkuW0zgWmSmoRlJhj
         wKJLMwAXCNfcFJjJLp5/dY2dXcYQW99h9FsgFfMlKleCOOTuXPPGBzCm4sfwf9O38BZ/
         RLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385230; x=1789990030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJCHzSLhrd043XzsASUdlLLUScQGc2AdK8sGqJtE+JM=;
        b=Ct07wL3iBxbn7rATDRixVM3hzHVGCDjpDj2X0mHi6lqOVoZbIMqtBWTX91FNo7b1dh
         J+hNtbWGe8WP5R8DstYvplRjixSk/hmpaZGhmefvAlpGoSDVDFZV/gCMTcXwMpM15kau
         t3dzvVbqUlXUf1mYV8FAspCUa2SkInmbWWw8RHdDCQaBF6AAAYbyuYN5iRj/oM4eXp9Z
         GB21jQUx8seoIZIi/2FfEdb2vuKvD8c3tSR7VrwTQpwAj+j30CNB8l/CyehRH5FOiRJN
         vHeRAypnG1RyI5FuRhEGhMaKIGp8cKydZcoL0JXSZzKlpG0rVkZYDK2ewQp/KYzvMfQj
         DB9A==
X-Forwarded-Encrypted: i=1; AKwUvBwa4cwSrnuOKMfIOqldre0Czwk9slb4uEIiK8QOGhSRVU/T58jjjOcSRAlY9z7RmbN2IxGBD1abHvSt8OYp@vger.kernel.org
X-Gm-Message-State: AFuF++m9WGJlq9VR4N99yLJEwG+FOKeiDfWLr5Gz6u/5R5A3BcB9y8j0
	9UTjBlR32YvobSU1G8YDULhHejFKDalJio8+LUsfVfBK03pd7FkUcUK0Sfx069AkHEdmkS9iDQ8
	xqxyh8RhtaJLn24JKwkLbiTHnqGET6kq+ol7wL6013LUKbus5oeb8M9oGUgPSrftZ36s9
X-Gm-Gg: AYBFou1CPjb3rXYFfx3dDM6hZouiCAnZ+BDr2ATPhChcgUtIIaeVHflPMIiXd3WBG/A
	60zH2HI8qB892tdNkZrqUG0OG/xyURb20VnBRoOvDka+eIBZMnyX84ofhqjLZU1E2PWPowntrpf
	MZZsRUb3AVb1p5UQb9Uw0kgd6IswnWGS/dPo61QHQrQkDBhw4+BODhJRcBOdooSndZv430VHdDZ
	gtEO9LbCqgf0xqb2bGYf3iBhQhxJHwQB9MnrrhRVTVkHbPOph0Jk3wCR9dzPxp2/uzFi/PJd+IC
	SqaJHqZcH1qu9fDBeTXLOH+ygsT3JdbIbp3VPUhYTA7plVo/VpdKbk2ByzBNoVR7U3gPP5kUZEg
	VTUFU36OamxBPVA==
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277727085a.21.1789385229630;
        Mon, 14 Sep 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:93a:21e5:a8e5 with SMTP id af79cd13be357-93a2986f870mr277720385a.21.1789385228954;
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm26107741f8f.9.2026.09.14.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:27:08 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:27:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video codec
Message-ID: <ccceh4gy3otlfegvbd2macgc2kend63gorsak2eukap4jm4vbu@q5pcxpw4od2s>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX6hM0zembYDoc
 EmxFtHvyNFlerGW0I47LNP3hPqU3Aeg6HkrGh6mAEF7B52htsqtW4obrxwnBepEejQYaLsEwLgb
 i1cHVAB1px/PAA4wx66bRzfmJaYVdKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MiBTYWx0ZWRfX67W7wCOX26Tx
 ryA8GN726m/JG3cP6j1VNIFwKPNV4HtSRoYUX2orjmLTBWsA0rPpNZblP7mCk6CDSvyShk+ivaj
 GUV/gM7NptmOQgShi/EB8AVctKCdXyEsVmjs0Mjl0HdQ0i2tnqSePmOh1PxFhfIhV5In7Sqmary
 RXyWm9nPHtJ4qMCs3+gDVGeSWdoLU43rpuTjEDHCamcaTpsyH5z7X9R8+HrAbuW0CYjhf5a7ZZv
 zeqk3pTy96WgHJuFtTVYvELiWOZlQrWzxDKeGE0VfDA3KqD3+SQhriR909laDnagIDewNGFfBe4
 Ivtn5ZeV7mqQxZypDhDPrC1TopOqe+MUu01oIe/sK3IgdxrGEvOgtlVm6GvqLJDM6MPcREAwnOZ
 PLDj1w8iMybczo8xMpnsgcasS5SczF4F2SH9kegwu856W1qHzUJgcW+gLJY7LAeXbpDItCmLx8f
 EogGfaxCkaWy/dQH0Mg==
X-Proofpoint-GUID: CED9W-0uphLbTm1NlwO94myJh-u03qib
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7da13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zFfZ_-Fbgzo0WQ8s5VoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CED9W-0uphLbTm1NlwO94myJh-u03qib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140162

On 26-09-14 17:54:26, Wangao Wang wrote:
> The Eliza MTP includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Can you send this for EVK as well?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
