Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349418;
	b=plaTnAH8akckp1qxb4VylbUhmRWrQ0uVfEESVouMlDA1EmPLo0GCXAfkIptrR/rmO18u
	 tta0UL8iw8IM3jHjMGNoj9VruhqQSoihs839EQIoGYKSmjD9maASElX+h9RUAG9BjkbbN
	 e88ejCdoSItDKi7EZzDjwZQD1G6RHrnrKrcIpeplRpwkNEFnjwexhGluZTrT4QyipOzzZ
	 e+n1tcDJbZwsggzp4SFuAR0XNZ+JhrYrFSrpJ2ti6Erf15TvWTsZ3jD7ciRd3x5gzJjBS
	 0CR6HXuxmODGunIoHbrndRX3g3PH8I11U/umdfLOVDKuXw/MXNGGuEx1i1WC7S0079Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
	b=j4zBfP6j0LYpSQUVBwvHXNxZ//eosMJGN3S3OqhftQ0R3nlKtXAHL0VMNYouyns64fI2
	 jM6Z2F1d2NWo5Vrl7RXC7J4VokRhkTXPSi2k4yLOUU8IPQml3zc7mx0cV81phw6wK3q1s
	 LG/4Dz2VkmuOQPyqDFQKMQNyTHp7om+q8zCd4Mg/IWJAw3kXbsMLAV+buFO2bY7pD4nj5
	 t8129ndaWtwGVwSyBTT63jW06eLM4FeDrL+fdy+zc1gHcxtVFfp527/5Bt8sBnb14mlgQ
	 ClnlWTfRrHNkJtvm0JQ8CCgBiM824sROA/BIg1ZomRlXegw2G0GZbzx+1L+rPQ7d4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPjPDEYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFE606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1BFE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPjPDEYW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0HG1119731
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=; b=Npb0xvIQGSRA+aPx
	7LKYgO9RBr8RkHvzdUIRK2LpgaiITULMMgOV2LMuvv7qbfVCc30kjRtkjViuKqth
	z5c7JU1d085ob43F348Bmix1gmiKoGwuGtK/cbl19KMskJEpVX4zIyO7KpRmRM0/
	mtz4zJdb8l088IZNKDpDoQdpXa0Cn2jtLromPMD6x5KiTJT1ZfybLI9Ncnnyhdr5
	0p+02ySBkrd+Z1xpOqO9b30XhtBb8lHF+KUbxdhLTZ7JgptGd/7NbMup0ycCb2Gv
	umRrktlFaXGFEqjwurdMZXUmn5BTFh/jMR9LeL4CL2lPhayQp3Aq3egA9Ya9zLFY
	EfR2Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj0jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so12727285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349416; x=1793954216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=TPjPDEYWnBzBwoYMHS51IshTNOB9XsSt1cLhEjB75drnPBZj6PKAYzTcW93vcZdgoE
         XwqVKITkX6nhb+6EncstwCt3gITpyM8T+kjtHoa5sHIXF2a4GYpPJpt8uOuyxmyg5NQw
         FxhaNqDC5qluyGYNhamTjWc+CXZ6Gxnr1z0h/Ipwdf6WnlHvC8JuPtB+vH7O1Z9DhF87
         BMbrsfxvcdH60KU5Ao2aqxknEeWalXnBtyRglRvur/G4ccGyZHkmLL/T+MoyW2UAWjAc
         PhCYVYYzPalOj0IVLYCuagUPvLjcNk1WeplvsMpxmJoC+T1PZ8BmFWD5kFQN8Tv6Sw++
         zsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349416; x=1793954216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=n1ZZMGSyRNFD9yyScrCCPnWEuSPeLpEjcNb4v7+RT1TMO0v9elmvtWOZqZVS6BDbEd
         chYZfZGQpiJiNx206WXndp+L6BMRDwUT2I0s5IABmyFqI3hZrjD0bzSFXZxfNCgki1j9
         NKkJ8yGULeRf54csydY0PIsosdZ3OUeyfsQmw7XuIaCl6KhcaM1yms4gQJn+qIuu6eQp
         5WSNhT+yMA2f/YNC1g/5NQuS3XwR9cgsnyTFxxc6p5lanXqzZ1i/ZAsFBaBs3IicGE3f
         x7SdTyJMbJ+alesaPzFQeMJNGZ5+B5IQqwYrvrbAGHbrypLyQeBfgqyJEjdr7ROgIV8A
         VgiA==
X-Gm-Message-State: AFq9FYJ/pRWkssowT70vlFKvLNbe21GOTdz9C4da2X0U55KmBK+oQDzE
	RUctxqsQfx+0NW6N5ZkBZ6vk1tS/0KendxR5aKLidcFNuH7vp7rlTxz59olNwk4l2ERC4VO7juY
	a85X+hbGQ8u3w0qaGeZKYy53w2NdRmZQWUr9nOVIUVEoCXjsMl68w7Y+oHtiQbiD8MAyf
X-Gm-Gg: AYBFou0HSXNdD82yq9oP8UEeeHWWwnqAaZ6lZVNbTjaiD/Sc5cWYFgkN614p2ajXZqZ
	TteTqKdzLqO53gwHDvtGEB9OI6n7I3K5h8FpzJZxaoLyxw5jfP+WvpuCCv1erKYDXJxotYQtwxg
	26Td0b2WTggHJGL4XqtpMb8S7Rejacz4yQqoMK2sSmD1AQVRfxOBDWFNk2Xi8G8x9nu8gTtQLUY
	oQfdaEv8266MCUbJFGOzQRd0npTwn4O0ksMAeQMPGCf5Tfl08Z4CCQK7sp3nIvacPvX385BecVp
	LPnjLLMTmBzknrjT3Tast6o1h1bQo8XULZq/Si+Dxy4w325mhdtytd/mEHR68A/mohhKXYWSk9A
	xGXCkFYg7iYzwNSGq9aXTsnoKsAZlLU1GmX6Df09Fa/8ZUn9c/GFoSShKnsHwHmLIznfa5+I=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267106485a.2.1793349416002;
        Fri, 30 Oct 2026 01:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267088385a.2.1793349411659;
        Fri, 30 Oct 2026 01:36:51 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:49 -0700 (PDT)
Message-ID: <7c8d7b8a-c2d3-4215-9c82-6083648c1da2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:47 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5v0+423onBc7
 3/z5UL2kBY923y1G/10zFBjuyZ3mTrOcoaPuxREKhUlQ56ed8Q6NqLVzzetvFpXbC9oUZLyI+YD
 mPhZKat3vU+dWG9DwB0ia2WRhdqUSfXSq23raESiNh6TmthXVt5Zf9wncSIKfhdRt1qu4yjb26l
 BDh7CN1N4OseZKKRvithD/7L1BmxQMOZT6DDPJK+UEbNNrGSfW0SjHCYgSXueQ7flfYRWz7yLB9
 sImk4yt5gMjPpWamQjK58ozY4eE2pZAYofaFnUMUN9n/egyXZ/Fm3rlrKjzThFO8U8zK++JXHVs
 CrPeA11Ax4/hP1ZwajPEijqVsEyri9eUxbHKgo4F4HRMQ0WsFHOLU6HHm7Mdo6cD7RoajLoJH9Q
 xn8pKFXsl5crvEYMDWewVIXDaugqYgr0m0HmgSIgQMjWfVSLbCwVjFNlp/swSGLUj4vNXMjgTUi
 0PbgZRBEpz2ayqvtnKg==
X-Proofpoint-ORIG-GUID: CdkaSdgO2isjMQ97kz67W7xeo6Dkqi4t
X-Proofpoint-GUID: CdkaSdgO2isjMQ97kz67W7xeo6Dkqi4t
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae45728 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r65pQlftkxrEpSp02AcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX6L2kM6ndn4/e
 1RlLkZXQoWRD1FbP/eIqlRsR7HwTV2UuJzFvQH2W5TwM/E+NrByUYrLCS8xvW9cDoVzOHfsnsGA
 1ilx7v/0ydQd1RuPlbBCdLo4uZkOXAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on QDU1000 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
