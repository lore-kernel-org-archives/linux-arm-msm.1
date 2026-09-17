Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0464E3236
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658366; cv=none; b=P5YjNLO/mZRjhVic1uf8sC/gc75Hfmeg+iRQZjj3hUXi8Q+VDnUsnGF+y7j2fegnBDA/n9lQViioNmevacANJQJ+d/l4XLQAo/Fkd6ZeUFWqyEN3DxLGFVG3sAaiiX+00UVPj+iZcNUsEZgdIIWYl7diwDlPIW1Zmc8aICvPmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658366; c=relaxed/simple;
	bh=/Z4wTl5LbY0XS8lD0jM8Zpl6/x1nCA9cmHP2BE9iPO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cModWqD2n4pkp1ye9/Nq59drCQBVausb9LLELgc74MqotarPHEXOh5ZcdI08zpSZzlcfWKqDNCdJ2thWJfnyQMXEqeat2qcVKJyMAdqHpD7LqTDck5UFn1MgPp++12pZA6gCKIVLAZoLr/IHnz0CPW+KY1kqi0EO0i//Ow/qoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3M5a60c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtQOm/4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3M5a60c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtQOm/4A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDk0ft1954828
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dGdv5m0CdvJUBahz873MblPC
	ZhKo8nu4pgz+cDmXb7s=; b=H3M5a60ctYzdxN2N+tDCL2JB9h7NHZ2vDRbUUMJJ
	FjqsxjgfCNm7iLveOxykFM47WSJHYNo8aoTzdvPfMw5w749p0mMsCxon3WfIMa9F
	yxAXiumfSU9dP3e+f+G729+rRXGPf+B3nBuInG8eRKm4CZVNKbAMpulCrdUJcIrb
	JYRaT5KfCuQ3QDxolfMKQoQRIln1vazGy7+x91DsA+vTLTpKOY9QxXd27E4jzqV7
	BleHw4BSgCMwzsEtXWtAcd/fi1/gNQPXMNCm0qHF1s375rNHiKI5fqhELFthrarM
	axDyVXUZ5Jj+Axelxd9HqGiFR7PShDaySCvwOXwkdO+Q6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gpb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8341cfb4so24247816d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658354; x=1790263154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=FtQOm/4AVogV/CHNnd6yJSgD2DqglRqWdQXtMLJgK9vQsppsMqyKicd4qI74KnzfH9
         N/NPtVl+ibXtUOQB7/RCS3nUfo/uS0vM6H1NeNMXtXxdg5WUD5j1wQjmhPQpOw3xVdSE
         lLuW9YNuYToJara0rHTLrhkELxdDrEKImy1MxPQp1OwmFkQ5qalS1qJC4sKSg5VTaFJQ
         KWwIi7R9EbsH1u9BPXKeLyaobZvQ0KC7gdDgVa8gSR4mq0afwXtK/ZmQqswFtD3v3W/m
         UWOAMErO9YLQj4TFpUrQy6hfCnGwVRXg2Q7ZFIC8BUuj84zwSj1XqMjCpgVxvYDDeIvc
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658354; x=1790263154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=VVBLgkNXy6rhIIERGjsW9U1CMr2U7oxkcrM3wuNTY5Cl70Mox+rvfwM9IQ57KhOrEs
         2xmOrBpUnzgA7wMkTY5drI6TbZOFNDZePkx0u1t1NeTGnUq+9p4gaQx3KftLMyCRigDP
         jyIIlyA13nne9Cq6qDx8l8Z6nuAHmp7jcPDBHnMJoh4U0hfGVNfHcNPnU35ylhigdYAd
         GiPVcqpr6VR6qJSBXHMEufwalib+gwmY5NG/8Dehb3ZQc90lp2Jy9lHXfrFluGQBen34
         aWVmJaOsiqnWlGuDmhN4gcrbFN7r3laci/3IfihjRmW/z00GkBhmB3ujCru2blE0OTrr
         G5eA==
X-Forwarded-Encrypted: i=1; AKwUvBxJi/NrPDA3YoPsEOOimVZsrR++gZhBQKNxELH4x70mETLdKbkTpxz5OdHm0gPlcmk3fTYVFYl7t2eq3AxA@vger.kernel.org
X-Gm-Message-State: AFuF++lZgtyPiPQLUzH/ofR/YHD+hh1ykj3SwwpuyaGm4xwoQGQKUb25
	jtWK8mrkPV/bSuAeFUECOhelM58b5EYjeaFHcH6c59k7F0riqvME66OY2jjFDaVuVSILsxbZdJN
	//yPYV3RgJO4aPy3IzYXj7I+amX0GfDInuppXQkYeod1pzvPxANDaHFHCFS3rOXfno3y2
X-Gm-Gg: AYBFou3adIp9VhXqlyaqec1QVQ8akETxOGCrT6RxlcFxUku5T+fx4Va7LCviNvrupsn
	O/jgMIqBwMg8yuzFXSOqVcRqzXnH7xrUWax+1s9NgeLZ4KnmXXp1II8XbTD1i0J/p8ZFFgQXLfL
	X0yJ+yM/Te9dCNlIAy+UvuO+AIS6fsTVgkIlhBEz/5+FvTEYsbOVEMnzus/+S9WqrzadZuKmZHq
	lGx1wnUwagmI7pO3yK7sZOcd1DrwGIrSk3WeqGhUNMh1BWHtCavUzyjFtgHSHK5ckAaZFJ+Hntb
	rM7QrA0wJXPPsCYBot4r1ky9BE4Aj8/WLlGZa59mAkf/RrJqVWwu9CbU874gFkCxcIQnEBTU+s8
	zkmHD0avIehG3TQ==
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16106846d6.55.1789658353606;
        Thu, 17 Sep 2026 08:19:13 -0700 (PDT)
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16105666d6.55.1789658352927;
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm83193285e9.13.2026.09.17.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
Message-ID: <dn5syafhr2z3ezwr5gqi2ssr72g6ikhxpkfztj2h2opj2aqvmd@a2jlbfecmz3x>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX6b27c14l25e6
 HQMgqQOarGBOnmsBD3eGY6AHwIqm/Wj4v7onv1UsqTG04Bu6FEjhtTME8+vVpkJSuR2NC4Pyhtz
 DZDnqQ6poVlp3PJNlyARDVQV6N2M6N8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX0IY1UkCB9/2L
 7irSD3R0El/9MLeb7Wq2SZuHkBDef5UIBZDHVMvspzHSFwF0AALszC74Vch1WE1e0oZMMlx3ERF
 swQFI7r0gfZbHyuRHjQ+oBkko8hOKIXjQMKOD5L6MaGp10WiF63CGP8EdMjbNTGbjKytRwmQG+c
 yMZW0BH5DCcVDj2CPpWVNvCcHdKwKFe/uRtEFwhIkHrNuHMIQblLDYbVC6JBnhUMvxEtGe0b5+R
 bsYhePF4ZwMHNr/TC9PdjLylXffeNVfcKZd74smx0MEAnsylxPVnAsj5apACSogYajqz4gvV3NP
 owQ3fSUTctGf0zS3UUn+79Wxxur4nCYi8iLibjD5Xhaf85n7/NDj6PuACPHXetRXFhB41QzoyvL
 kgVxNyGt6tMHctoNL5y9jQGMi80r+Zp93El6z+cnSlpywvnF9RDq61DacWdRnsxBGgggbnj6zKN
 lhG1gneGM/3MJeTPCiA==
X-Proofpoint-GUID: -IY548a0zZmYhxHX99LcTmSh2YZM8ctW
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac04f2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -IY548a0zZmYhxHX99LcTmSh2YZM8ctW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170217

On 26-09-17 17:55:22, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
