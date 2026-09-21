Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4844B663
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978043; cv=none; b=WIVgGtzcfsrmWYkG6Lo0W4dD6GaseG2Bmil7tMB4aZGoRq4zfDnx9Ce8cuYeh9ivZeB7KfI/QcRNBy/UMVsw10m1JDRGxGka94zp8zlhxliexN4x0hQVx4y6miEwvaufSBBZ29lxM/bU2sya02WEsS1o96nri2lTHNphzlEx93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978043; c=relaxed/simple;
	bh=/o17aeQpgijRlxtzZDnQOtrwdMXAWUUf8iuyJjuFB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amgzgzgq435+kv2o98EEL78HSfJFAqBoYK7VaWK+Cdwa+1o5BZ4ey1SBCOXfy5fBaLZx5pJ8bGzx4D+zTaRD+m1jYEqmpsB4jqEKRN9iZdigJlpbJHsz9z9k/LvANzKpfO4S1GoTXYzp188bP2eKKDh9V66jf5RpEc9sjP2gqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYtOC6JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aH4iKKCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYtOC6JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aH4iKKCk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79pe71095975
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhh8R7B3dmTfCmH1vu6b/0r
	66BrQwpPWHEDqb0z2p4=; b=YYtOC6JHoWQ8RkNZYeJWyDX9pHGrXKIbLQUHxy6I
	zIoLmL6NbBBIEk/LsUQfZWxk0vVb4LuJs+LOzvborzot6TUqLkZBc0u2aenWyNLq
	UjQTqiUa2c82g9RGSh28v6GJ18jV8WcRzS/ID1mNcSfGFs7cOv03dbLn2DXj7Fyj
	VQD305oEorgxHqafJ8SjgRJJOOcQfEUG62PgMIdi+JuRiiixYB679knjSZuRHs7R
	KdKeghEB4aAdRMzmJBfM4CLqYN9kaSH9AHGTFcPr2fRRvpazBiT8yDtLFQ2g9UqY
	LOyFeFwDTK8EcmXNShHOIXU7urEK/OBbEwLSklb0W1T22g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw097h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91213a1aa68so46765426d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978040; x=1790582840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=aH4iKKCkzLDrvgJRGt7z0Ctm00nIywF36k4WYHCQK2UkevCqtLBMv7d/03jLkWyCRo
         W59kZUocgD8Tf3E/MdnBwocXF3Bc2ABhbI9G4rbNr76NpNdvL7kGHBOVy7WInON8jlnn
         xsP+qgACUV7MIB8fOdklOwvzJawR1jc2ZWDO5m99tN64pKCHjYpN7UkzZkxWcwl2IoPx
         La3jQE6HyR3J/DIq2Cjk+pWPIZ64AhHZKOPFl1r9w2rt7DHsS+JYeinP9RdVeNyO0PLs
         2K0Q9v3qzrogoceLVtKYb/Cb7nYcRUNE6L9oBu+2eezzDm4UuDaaB/Almr3c5yzBFrB9
         J84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978040; x=1790582840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=z3tyt6r+4+J7tyLtB4iuniMwgGrpOVaRJD4V+Smz2I2A1FIXrLlgcHi8q/cyZdIqBg
         V/VO7Bh28b01U0jgUwdl2SF3zRTJQ5gVmEM59H0DqudFmzVm835iix9RhLXgfmAzYHPF
         qa9HtVerFaZ7Q8Mup4foq6H0DGJq3tfTRvf3LHUr/jB59tbaAQC1d3fmRVdCoo6h7wPa
         c/Y2OqJiDw7I4n8hTucGKADvgjEU0rY7SWwsBchhRRDvbPMQKHyiRtO4BD5a3kHbKl43
         PE7kkl8dh5mY8og8t8Yajn6HK8OVXf4LcBwJ6mDuqIEDIxPex2VeYMd7Y4nKRM5Xj5Zd
         SMTg==
X-Forwarded-Encrypted: i=1; AKwUvBx7VLw3yOEQxmg3cxuj7tqakLCXI5uVRANSKKcSONHtPdftcsz+zyiqo1DoE7gPs+YC8MXvEq/nFgonrO+2@vger.kernel.org
X-Gm-Message-State: AFuF++ketKoDwv7EFXu6cpULDe0AYI0gKuAPer22uTGtjvi2vB3Wv2Ds
	THAul+Fs3g3gqrFLz9r/fAURvPkqvfNWyTIohi5GmA9geahSYYticL/02MfcQJHd90cWDtMyCN2
	/E/foJ+DWq91S0OrN4dhSlexkhVY3WMYEDO6j9ThtiDKvW9KLxaqKFKXe6pAkOep2JZ7U
X-Gm-Gg: AYBFou2KCnGN/8t77u+WcBH9gBu9fdxQ4LkFJ7GxPP4axs7ftULoQsNP2LL16/LyzzN
	LQASAWjzoh440nXfP7Qoo3nudoQjGVpU6Upa3jG2aUUWMcdSI4KcfcrTulXKfWQTXrJ0KPIVN3Y
	MR9cDkAQHnbBZk287fr3YOjTUemYuKc2KyIt7cqKgA0lSGM9lF7lj+Rl+FbjeknMr4T4hhQINZY
	bF+R7C8HZiwBeDgPNIv5HcfHiYk+fDpFWMfpJcWV6kdwyGnNAIia9SI68nARsvR3SbSP09en9zv
	rvUEcm6U/1vdu79aJmgk2sf/fr1xhyjtwn+LlWMTbIjWcvkjPJdIPfMQfdDXHsCQYfecmvsC9zL
	VsTYKX0C/anvEsgs=
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836538285a.67.1789978039847;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836534185a.67.1789978039250;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd2bfe3dasm91475615e9.13.2026.09.21.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Message-ID: <qecwr6lfb53fjjsrloakyhopeavi5c7bnskwuoyw3hviizp6me@fj2zhuxwphc3>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX6ZK1MH4Qu1/U
 SfIyBdX7kecIH+JqDJZSCPVTJEkPhkBX8fOXm8sUyuFaa445ydXHlw5L2Vd4AKFzUGiHblNIeUl
 3obQeHAx91sFNr883MjtZsmRHNS8QmFgsdSXUEXJr0VEX2im5fcDJh09kHIxgXsUOzKYtQBxX8k
 4Akv7ikANKRdKtTZa8CTYtcMDr4ms+JD2H64R7XSWc1i1kagyaCNYjYaOi5+1iDRf8gss0w8CAU
 FuzYiwOQ7W0aVnTFlg3MiCsvPU4Zj46An62KQIDZ2p92CnZ3tY2iFqtbJewK7JYGUtZeIujo1D+
 +yjHGLAuLnUjabiicn8N8+vl6XxNPNIW2stsMzI3yoHJaYm0oZnlwVWadEKDAu8bcfUmG2aA2Kd
 52xVNp0CkfweB1d+XMYcFYDkx+wvL74CK3ZSJU7N7D4KV/NJTo3CWz3doPT2KmlfCMPUq5iUD39
 TehwHfTv7ljw47dIvRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXxKeTbLwYYeFR
 VDAFDDZOfFZgmiJYiOgzSvD6Hljo4cETALNxwp1gURpx02K1X/ia4EKV2AC05iCitTbNbf9SA/C
 iCZ/0s6Lk2B0U9ccOxNJRhYFKVapz1U=
X-Proofpoint-ORIG-GUID: Zb4ScTi3ojh5j0R3nsdxrVKvV4oMQfS5
X-Proofpoint-GUID: Zb4ScTi3ojh5j0R3nsdxrVKvV4oMQfS5
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0e5b8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210115

On 26-09-19 10:14:58, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
