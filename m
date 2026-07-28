Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8B3D75B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226098; cv=none; b=uvDHKDkOOqSm80kGBRF6mzV2E5npKH/dl44zOK10SfpUmmVcHahhSEmkDJDGPBPGk+er1/KmsdYS849PEdrtxZnOVLD/LfzbpfwhdXgNH1lQn7/i/ljtJU6sFpkBF3vYOwqe6RQGEnoYvadKgQZ/Jd2/PfMHkO8ObrWllozl+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226098; c=relaxed/simple;
	bh=q37I5XVI0Q+iLKP5qsaezNyPiLXtMNHajU5etzKIRWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvD9lVD1zs/1GGaCUGgYOgOCQxFqU6nvXMtO//lPZvW0ydVDn+YxmFcJ8UouNLWP/MJTzZzLeVdGmX1oPc0ZmPUExuy4wfiGJgDEH+A7zcDjDjw9k+9qa/pWwTfjHaaW1GGl7yiTYVXQ7mcJf5E72sP9wk8wIOux4ItKyWY+CtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdX/o1D7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FK7RUKgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdX/o1D7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FK7RUKgH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DSa2480117
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=; b=MdX/o1D7OfoL8HbX
	6wCEsSoj02rlpqkKU52J5RHlg60Ps8R6YvS/USZmoqQBQysjoVVFUiMF9b58/W/+
	ktsQtjwLoB6kQXwVGOLytuNZ4ZXrOFW3u3D7/OhUPKlU/93wE7UpQoWZyynoO59n
	1KLPwm1+JLNrFcrwCwPCnImXhKE51stSwl9h4lsxtTV8ZdApNKANFRCDBLca1DMd
	oXzDNp4fY0kAa1YyijhBuc8JJidNUne3vASoUVWmfKgjN4qsVeriiBFReKBoOGWp
	HhaZdWrPfrvEYmE1PFrjuuonQHI1CXdRxaHiLgx3kpdd+50VX2R73Lo4b08f6n2N
	7YugXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy10w87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:08:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93105103d06so16522885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785226095; x=1785830895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=;
        b=FK7RUKgHtJ8cMzxm04rl6JmdvDDNJfZQpzYzaT6LInA6MQ62IWOBtOsZqKWSDreBVZ
         BBPtuZpUmdk1nuiJzfvZZz6MPF3vVxBeBySJKwD60aGfQXSQz0UrJb91a/RKzmfW+vOo
         D8lielY1dDIet9x4lTKYT/gxybfzVpMG5DRjRgtzDZtC+JoWClFfMMKg2hxZR4laNPQa
         v9dIRbHDnOTyF3NP22fn+GW6PfV5+Eaq8/JgDfBz0dsZ6GihmzZHQ+p+Iwm58V5+bYvk
         875vnqc14AI6s1UgmGH+kUnMOpezBQx0/1MuPG8TMEQglQnQuSx4SffnM9hupkHC2W0U
         wUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226095; x=1785830895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=;
        b=fcKvP896bURSa5Md4nLkoibHCVDUYagClqWAxXRd3xSRcPA5P++egPVZs9g684j2NF
         mIZU90FS4Ll3GMYiZxkyzakjfcLGyCJWRkWNMuTLSMxT/3/dKWpxPpGALQaywqAM/vIi
         X/8B/H0gAlYKl7f7P9htdEAkCR29RK8Gz8YrFQy3MxCANcF14tZKXp2XfaRIkYqeqRMz
         oPa79vEcWtSiePFaG0gB/Xauys0dtArZMMi22B1rRuLk0C3eDVJNVH/OMAqIcy/MYZ8G
         ALL54bfHla1i+KwNXyWbmzGDZZKWKv1fBIbCOUR0VRreZhglmNZah6DDI/Dl/qyLLE4f
         Y85Q==
X-Gm-Message-State: AOJu0Yy21oDKJvj3BOnoggEzx4nVtacGbNC8Xooh3SZ50MDV3r0tgl3M
	WQxfLBXshMb6iungKipAGalO2acyJuM9BAgRFYSO5pyxdGTOcS4wN5GouYb+aCZhBVkPV4THALu
	aMTso58LMCHUC47DjVKGgwnmkjADEVuKxsgOyYlsC3e8KmzUC2MjPDEA1QM/PqKR/L5PE
X-Gm-Gg: AR+sD132uRhxhoHOYnogmDwzf4ormuzYNY3zHXai3ryuzJkaK+Q+vMra2+4P5wayVhM
	CWAAKvf6ZeK4Llumk14DpNPa83MCF+N4OaubWy+eVTaYzgicx+2tq2Rub06viUkD8MW3X7nKV2c
	ceHDlZkmVPfSQbhnViyT0QDhGCjKIIpFGTsaAJBj2ViGU0KB8IDVAbkiaSGxEMVFssTc+7Yc22q
	euNTawAE9Hmkb0U8S5Yb77hbSq/q25k1zKdk7cFjhwzSQFHBkpphKjJAonU+o3wvYbC9lz0160k
	davkSBL5TPBG6wuGkcnYTA1Knx7THiGPC0P6rZAAJr9lauDhmqG+P+ia1GhPGXB1XJBWP2/rzgS
	KiJNfAo7JosljrLbFwzSsXGVJ
X-Received: by 2002:a05:620a:a01b:b0:931:23a:83ca with SMTP id af79cd13be357-933027200admr143516285a.4.1785226095377;
        Tue, 28 Jul 2026 01:08:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a01b:b0:931:23a:83ca with SMTP id af79cd13be357-933027200admr143511085a.4.1785226094885;
        Tue, 28 Jul 2026 01:08:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm720897566b.9.2026.07.28.01.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:08:13 -0700 (PDT)
Message-ID: <3e5470ae-887a-45be-963f-ee3ab10d36d0@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com>
 <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wz9TpDPhUlaCB6zrJ_zW4hmm6noK8GzT
X-Proofpoint-ORIG-GUID: wz9TpDPhUlaCB6zrJ_zW4hmm6noK8GzT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX2sP+9374QdEu
 A26Z6cdnByJmk9PCBJ2tqXbXcLYzm7NHphypWtzbiWkVODJsSPeWSXG0gKkvTNm9zzLrf3C6leo
 vW4Cq94KRwQPyxfWZfersLnI4y0ybq1inOjBf2v5wa8XcupTzSJTyF/i/oeSbQcTDBKbf86kX8i
 WAq+DuuO0PU0mdaUt2zUopfihMg/BISXAoUGKp/gfMk1/A87jY7K72sANWIkH27rDto718Fx0Km
 //57VxSr5p3IfufhliqubAdkEpEYulthvv6aAaxK171UqGoOvbIBe5En4OAArAerlgjdYnhoQKZ
 0j/Ie+LC3uTkQKpRquZAi0Zaci1YNO3+f/3iQ8QTj6dwJ5E6KXn7n/4u9/dVqmvbPApJrhBx+gn
 x1BMrtweg3AU7PljU+9/aMOsSGfV64GzlV8nPUNGvS0SEcTWVKRBb63euRiaeVi8ADDmfUd/eed
 0Jjd3bdVBkslQNSoLng==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a686370 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfXxWKHoPiyW43y
 lMMd5ExJW+RoLPT7DEH/uea0igfSzWqXvTJHolsbjmrCwzvczVNT3MXhEUXTxKZ+KrrfJKfM913
 lN5lD4JYQ+l1Cl9Mf9AMmKLeaRM4g+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280069

On 7/28/26 9:06 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
