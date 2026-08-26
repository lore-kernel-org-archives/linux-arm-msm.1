Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FE34389D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721590; cv=none; b=Uz1A94WEbNaPrWIXxWjlhuQwEJfdjMgzuhjWpC9vIk+pydVz7FAvcB7fj8D3E0rmnqLPSlY4jzUm1RSJq1QE4OJ5QjDHk+ptkR9qj5ze0mkvsDf5PfTwD7jLPn6iJD3Vq2oLSg1fPOggjv7grtPAIlhpt35wafEa2Y8rYEf6VaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721590; c=relaxed/simple;
	bh=t+HvR0ppclsLjqzVD6bP78Xg/WRSbOLN3LWDgiVfpPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu1ahPXJyin+lUes17LY8X9xPi/YWP6+GiDJsCDOOVHIMVygpOU/SpdGBNufUqpzXDm3x6W1ECSpoDOMfWTOzsQ+v+nzMDfW4FW51BOTBBQumKcX98WO5JHLUZoSzogBWZJNdXpGhme6Nmjb8326P8lwxrI+mqW5D/CAyHjk73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxmgTnqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls4NrSbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxmgTnqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls4NrSbE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HUYu2705823
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vSkYOFx9qKF9D43d6utTFHWm
	NSx4pj5kQixqWQhqj2E=; b=nxmgTnqONmGHM79l4c3IfiaDjbZ1pHx1FlQ54Saf
	urWRgG/Lnwv+4bDEMFqVwZ+Oajbbcr4UQaKLeO6ZA3Esm+5t55PJPUUCp/4/Jd7o
	3lUbcmvp5yW1esqZtWkqBJux289HAhR2UwpfwBc9oHXwu0s3cZdEvRQ4XWZVxrFe
	8ZsxyeNrL+QCJi0eEd5J8l/KtnOj8nNr1I5mpFsqcU8lKluMatXhkoe20bBAeEv2
	+FA4SjA+Mkn9u9Vr79Seq1g5zuEXMk50Y1XGQ05mUYm/EBJj5jPtNqB6UFblhB0v
	iUbxRsv0BIF+Oyo+H1/a1awAhYCqbKjfPEfp6qtd1XBpdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9ut521-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52de05de414so7008741cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721587; x=1788326387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vSkYOFx9qKF9D43d6utTFHWmNSx4pj5kQixqWQhqj2E=;
        b=Ls4NrSbEUTEOxMRYsb6pymik7cnWumiuUVIeKZUaXEa8NyATdxHQuJsr1rIuOCYsEg
         QjnwQXtn1nlRRyc35dGm6lDyxzGUoFCKU3jpytkGzNKzF0AypaZEt40fszSjf5OhUqDO
         zBHd4+QII9jngiVFF/aml0MXovq3TUktl/O3t95MfmbGv6OKhYeirSDZSYbb69feuePB
         KyCfXvk5H2cxLzQDZ/nWR94uOcrrtJycR+MnRtA/R7YqnSZUUQVn5V5LXvWQXQGTQTqL
         PBttpf4Pz7CSwFBHe+1oJE2G1MWIy7NrHyJh/GNPs0dRLgTLLhr4UUW5z9phn2Bmedca
         fiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721587; x=1788326387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSkYOFx9qKF9D43d6utTFHWmNSx4pj5kQixqWQhqj2E=;
        b=paWVJK0S0rC2QLqWXfL418ab5D0WON40Xr3u4VGepEXheNn61QiKw4JXe1r7WlrwNZ
         KVDOX14JCwSw4lDGOAQyteE7w8yvLoYcgcNBKfTqv6/ptUaHbY4/fqamdT8uokSjHJ/q
         VzQ+ZWsBG7spmGwf4ICONuzyOSHMnbQXZLtq8Fn4IJ7yihPCR0lYU/cO5q1F/BHdfA6Y
         LHrLVs5W3Q5cDRyjWbEnWKbjIwbCVs9iEeBjtrJR2TXURQtJz7FouY1GHDr1IoIDTHjD
         qP08r/l0xVBVWAC6JU3MBdxyj5yV7jW7Luo3e+Y1x+vFul99RkU5HFfaKsQOxz1B/eVL
         C9Jg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8JMqY7jXH5QAP1k07Fi1QMYDvHzFYf9/zL0FlL7UPZ094ZBy+82+7wvfUxNUi1pdfBLIQyss1+f4D4RgA@vger.kernel.org
X-Gm-Message-State: AFuF++l+s7BIRIc3w4usR2QAbbkK4EWcbA/fPpvGQtFv68ssEU3uHSoP
	oyL9Q0uC+0BZ5ETd4f015oHy9/boI+Xwn1XscEm707PhLf7Y6AX6wuBAojpfKEX6+e4JvZPMJ7M
	efDZTYAEaNxfYVqkZdsyfI2dqNp8PXtbP0eHha0Kdm5Vdp7ynPxpvGuxeYxt4+nAVzTD5
X-Gm-Gg: AR+sD12cCR6XePwOo9BErOTDV5+u5LexHXNxSX2NAR8SBEZTxqJxT7VRXF47CjISZsH
	gkSTS27ybijo3VPBx6ymPywZtS9nlQ5lMe1jFLbxKXGp57osisYETa4dKEt1aYxLf1tDiRsfeYh
	KxBPatID87HPlw0uDSyDOmtzTkae1sZlSnSd1etln6m0jtB1bLOuVC1fp7/Dmc4PE5iPsKHwQHB
	e3zevRwbDOLM6aSqWbzJ4QnUhIwql/nQgrv07+rVcz8TM8CQd/tMDot5e2K/TvTJuqu1GeEix/O
	0Wt6pzCPxTmglI9j9VIMqdR684ip46gvm7fT0a/6MlMOj8L4eNZmuEjEPaNKIG785lUo4sMaFW0
	0pBnXNOz1ltoieg==
X-Received: by 2002:ac8:59cf:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-52e42320599mr39935321cf.22.1787721587528;
        Tue, 25 Aug 2026 22:19:47 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-52e42320599mr39933661cf.22.1787721582362;
        Tue, 25 Aug 2026 22:19:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68desm428450866b.10.2026.08.25.22.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:19:41 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:19:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: mahua-crd: Add PHY supplies
 for pcie3b_phy
Message-ID: <wufgybb2cmn7d4zp2bdgwx2bqoekefba2dxyksvkd7grhbe22l@tzaivdm6pnib>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-4-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-4-56ab597d77e4@oss.qualcomm.com>
X-Proofpoint-GUID: 3F_Xu3akLTYt6z-DtiiB6F7wRH0XUY3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX4PKjEku4n6Dw
 ILZdz7e/N/z+Z5RefuYkggw/YjeDYCQG4qcdXim2Po3bbGSe/KnLFpl2Z6AbO2WRSEJc8UWrCpG
 spgws10mXoA7pv05RL1OB3CPJkVfZr3lH7amyeXc9P7FXrX9AWsewQGb30ohQI9Lo3ovOlQLWvu
 V8Ex/rmUZm4iwL/mIKPaK426QLKY85VR0FUpLx3zPBS0Gw/qkqQ/NKEsbaVMXRMDaIROtulNCqF
 mrVGf6X5czlYwh16TyQLk7Wh8cZ/kCh9G1VSqfC1sLFfMfHXH2V8digZnNS+DQ2WH1aHoDt61Q9
 5AkMojiCbPOI9rIBo9YkBYYqEyADYHziJoOXOlndA0cd07hdG1DludvVC7i3TCO8NjKBazKZ42s
 1a6mhvL5k9yb5ZOKqAhZFYFI5C3QOyYjIBRcoocpSKDltzSISQk34CoVC0e49/pqI+nxbsj1sb0
 CwMepZUftik8rjH/Saw==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e7774 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pZ6eNVg1DDkEi6vEKfoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX3frkGm25teU4
 8FyxjBbedVHRwIU+jtLYV3nIDkaWqtFa7Pg9dbQRqx8GK5FAZJzsmaH25f/D0R4YAoCwiQXOCKg
 XsR6wJAUJ7Eb23ake9Hjb1+HoHoYb1s=
X-Proofpoint-ORIG-GUID: 3F_Xu3akLTYt6z-DtiiB6F7wRH0XUY3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260042

On 26-08-25 19:59:23, Qiang Yu wrote:
> Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
> &pcie3b_phy.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
