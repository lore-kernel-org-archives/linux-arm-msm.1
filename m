Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578882;
	b=zXnu9VD8+r9jSN+q1MwYV+MHOTCqyh4OUymkUSIkZVB76e6EvuDaQUOXotogPYkWtGp3
	 v6HJe7FTUsIfDtS/nWlHZ9IoLY+0sUI+ZSS9P8+ML0i8v2UFhvOFNB2t46HjL7TQ+GRc+
	 Cj4+dRffLXUyzenFA30lXJqFoPNG2ELFX1hMFZ4/dnavsMUHMzQ6ew44lrg1VtLM8ARlZ
	 Qk8LI9qkjTmr3ZIKV5ItpN/76g4wzXXKaTZD3cNYx0HpHuFnOF4lb1nbPKX/1KS38KQ3U
	 LXzURWdm+u2ami7dO5D1ZtuEbXAZWex1Fv6cldhN4N55DBHrN3K1oggowhw90H9gACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
	b=VPns3igRO1rlR5foo7b3XqU0+0JnBXxld7Q1kublNenVRw01zwsCb85xLWMf1IP4qhms
	 NZ4UwL9NWamyrfacpEALoYIdkW6XuwgFMva7ly+fs87w/eRYoDsqQU/huigxW7Ng9/g7G
	 4E6OKne5XbGxTJNP8yDHGAJyA32zHoLIZiHprUf9jlnUuFaQ5zw6VBGZOSQ/2SvthNEv3
	 LHMueKZrha2rHIpuwGiz3gKSxtAAC4IL5U8T6MbvEzQjiaPXvLYdyn713rSYAoWTXJqKY
	 OoF/U8UfpgZbcFdzh+mDqo6G62EaDQ4BxyaU4cFbkLWSilVFyTVUGkviVYkh+/DDV8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mqZsT/UV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cs597UxU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqZsT/UV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cs597UxU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA65Ni768778
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AuVFNaKOTltuLA9Gjq4aqgFI
	KD0er9JDscoOKBdM2kg=; b=mqZsT/UVbyb6xJ2sOUDW6VyZkWEBUWWn7tTEBT4T
	Mj/J2h2FI/sd2x6QdAKs8T++jbQyFbUMnAn04k4UHBHWPCbJxavdFDNH0rd7XDFA
	9G0ffL1+2Bagk8vDH/GwaF2zbFc/qhJO7qxEd9WaDf2WpBhB+vgVv6OMtk4pekzR
	e22W/CsqqFIBiQbhn28TnFoTpHahMHej7zKDoDWsO4YuHzfGVh47wHjfchi0hANV
	WWzFBylAg+qM7KsWvpwOcnotJLtp3n1r20wR1G6et0xlysrPNbrB1zBFmXxzQFVp
	sVR2wxveT9hYp6diAB2DvuHj/02/rapY6lWj7lPj0a6+nw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02q73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b994cb09fso13713146d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578880; x=1793183680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
        b=cs597UxUtHSBMymdfDpeQ8X9BS+9Wdt7UJSRu80icmPcP46VC3ukyS0ihjAyF277wI
         wcKXhtcOusmAf/yXToUuzX425C3Q+NSNJsv4cW0fG0F3kMsu97qCgtWaWeAaXaW43QRJ
         paKCuvvXg1s33u5xirP+2rLSArCBPfKf1pNkpYyM5glT7C9vPYhKa4BvEDhss976DapD
         gMS7GH0+S9+V4ICTyCoZ3/LJqrZQL7E+O4+D+76BClOgikxgSOvVlT3t7OsO+Hfx7eX5
         cM4DcS3fJPSf3ySwvjIkw1NqkUPE8iaFsa8mKKCQh8AHlpNKiHA7bSQCjLxS1TP1IjdK
         6b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578880; x=1793183680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
        b=f0/uxFgYcZnp0M4kipxwrW/XLiS+47oaUMIV1rH/AfRyB0n4h5H7Mx3+uHYwLHIgVv
         quFs7uDojt24E13Bp37c1A8YIUGAmQLFMwv25PF0EwfRt150FfOCAFYEL8DD95igk9mb
         u5S94liaGIx+o7Kr4B973XaeNDYPkmDFw04j00ktm3RAXLgAxXdkyejvDS8HMz1B1Cyi
         fP4SVYmp07ZcHAldfJ496gQcXV8P443mAHeqPEziHSE6BD8GREi9DpKi/MQz4oWvz91x
         cQNnMD/LUjfcE0ti403EdnmIafMnjTDEjngeB05ketWfq7hfF6Skls51cnVckbUXuOF0
         GH6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzva0fE8cWDkTjtk9YjYn5J3kiCu1qdPPLcEdnJX/u7YLVTP8qx1NMrvbXyDgWyl3S13pQbTPspTHDr+MYy@vger.kernel.org
X-Gm-Message-State: AFq9FYItXPX3gGqriLuYWMt+wvuBsp82pSbQfUbACdO/ISvjHszwK5o1
	CpOsPU2gOsGIKU0vkVmV/z4sMtFhY4rlEGtQwoNrE2P6i17FOk6CcyPImCI8JRPFMbiiGPAPjFT
	UlibSiUdbNxBk3CIW7I2kkels6AUul1TCrT4fX8bXNxWUdeloS4j3jCjvXfWt0YrQUMajJBDjwX
	k8
X-Gm-Gg: AYBFou1W9GZ4eKBgBACwGoRjfg8UlwRPMyeM7dumVhi84gzlmzZ1JivuvWQLgYZypDC
	CjQN1qQiCOgHmcLrCt75vQ1s6xo9wBRIZiYGudBM/cM+Ed16j93fiVAABtxDFeggPtLqJ9yetQK
	mP/4yUPOMO9lJ+Qamc9L9vlc0pBfPyEhQkTMi3Yhc0jg9sisgVPk+pilr6zigVJ2Y7z/+jtdUYH
	jKpSR+AA/6k2Z4aywS86WeWkhjNHzLBMfXncxyymjwmSXvg4738tVgrVCqkfXPyjeZMTB7NnYRd
	nH+hZ3gfz6alODs9toSQwF3RxozGs4XLUPYra0nqtYkO1bwwXuh0jS6zJNGcVc5izDkgFpZBt2O
	uLEYQRRj2WLPTmqhQ
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr338405285a.55.1792578879519;
        Wed, 21 Oct 2026 03:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr338401785a.55.1792578878901;
        Wed, 21 Oct 2026 03:34:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm4741185f8f.34.2026.10.21.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:34:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:34:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
Message-ID: <iqcuopp4vcirhjjjdrnp6apn6tfqb5ziof6nic3u24jpz2jvir@jmhvioyhrznw>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad89540 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YGidSu86xR9A4gBwsLMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX3KxZ1lHjQF96
 wWWu3In8j23JSVXgvGqf+x1RcK0cG/zKtLUMBfJzpT+7L1B2rft3iuC1G779ezGFMKDLs2+lD3w
 t8nGlkIvuh4m/XmW+FzPAcfrMoma/eV56U1wbfFy0s/ozIDIKi0i/mMRkw5nkVNVK71Hq43XPEb
 ULl2HgJJFGMBWNxhGSCvvVfgFaIaf+TYArVktKkRdyoHPIzDcasQ+LsKfKJrg500kfo/5mCOgmM
 e8Hqq5khLZFBmWTPoGqb23BAflT5dzilBSLm/PXIHvauZR1pSVMJ34hmZn8DfX0NtDEKU7aCzET
 FYdgDq3ZRBp8DuquQREG2eesxDxRhW1hcIEQmu32HdWJppgDEIHknspaYxtt+q6eKjRBTzo68AG
 ymQNXzCJAXajB2IPn9wQ/A6/u74AfUHW+WJFOo51cIehSe3HSxnFXBmQA2bttuaHke/phcc0xzc
 rx1Drc3ew91J8ZUXL0g==
X-Proofpoint-ORIG-GUID: mMCJ_54nPjWlKR-JJVwh_GsIIoZGyWMU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX26jsBEepSOSK
 WGRsXl5oYBWSOKATPwChNqkXDstPhdBi/66k3SePW0yz4OBP3hgrU2NDGULjMIWdm1yBSDAB2c0
 VxIcCfqYZWy9X3xB7bfPix9vQh0BHMI=
X-Proofpoint-GUID: mMCJ_54nPjWlKR-JJVwh_GsIIoZGyWMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 26-10-20 22:24:50, Kathiravan Thirumoorthy wrote:
> Convert the hex values in the Glymur and IPQ5424 configurations to
> lowercase so that they are consistent with the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
