Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992683;
	b=OQvdwRDKJYdeUyrtBs3ktgSgfGjgXal0zKKHUr6VyTml9w66IWg589oMP9KQEQoI9IF2
	 R0bNDXXFlyH9iJdDVnrI0wIWi8I+HZnL5fnbyU/eDxT8DKtqSWcFA0KgTXcPCur1UjSmW
	 LHbYNqK6V9H6wE2tXJsDaoLf8T5fgEq73c5W9siTI0zBKw2nDiQnI8VRtvJMFTM00ao6Z
	 udgkv9PfW70QXZyJsw8m+rCeG5dtfmSUS3Ls4fwZpyl8an3iyZLGUCam9EP9Cfoebnt67
	 5xXt+QJalG2slTfjF4fJn6DLxUEXcKGeJieLkfP5HlBbbvqbjMRUwsUJQlECCC/4VVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
	b=JCS6yDqf91r+BgNZV0nHDV80f1t+IVAE1KpejWzaUNvNQs8jWiNeC3pn+7ssTGV/WNVh
	 MtIDHpZHhrSiDVelNKt65IExXV2UdWTETNjrVJWOf7m2s4XYlji6rbgpBDaGS/K3t8yS+
	 ZoG+DzfH+bHUdpO2mAbMOAEkUHsYaf+tHzPNY1idP9quCGdjBCLHlmEf8b8kyePXnymls
	 jvnNn2FmL5B3GyjUuvPO4BHu1lknwAbgdLLKe2BFHOZkbYt+UqiYROHVCj4Nva7oxnPeP
	 TsC6ELL0mc7mjPyQdxgNoLOHaj2AGh/kS8ek4e2fj8hmj8Ao9mhpc4syLoYLgJFCXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjHQO5TT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="etx1K/YY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51859606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51859606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjHQO5TT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etx1K/YY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b8sc1907971
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=; b=jjHQO5TT4qCEYWvu
	9a05YClP+echbMyLofIH2MSnKayOoznBn/j4JWNHM5j1s/kH78OSoItHe+Y1Uimb
	Ct9F5kNV66vWR72XMOy5HMtMpk4UeKMYJKeLUKGZ/xU/hEuAfve+JbIIpMWqTah1
	bGBJnvNGYrla2YG4j9mzsaHh6ICJPHOGf8yoemQZc0xD/RMFGhR/Tt2NTgnePEaB
	TeGCb1daDNE4C28WcAQsUNJ7kqADovrynsvvl3zGQIHHluHk2+3DzVYelHVaP6Uk
	OsOkRK+INBDJh6rG+cBvWDW/yZ4vDUfi93zBs1rm+p0GCykW/2vGbdqzakCHNR49
	dihZ8w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmyd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:31:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso5240385c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992680; x=1793597480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
        b=etx1K/YYlSBFzRyJr+rj54tdeVHHLZ52sIRq5l/tvmD4Nd5bpIemTo7F9q3lr7/AdX
         L4rzDbAs2q6i2vAiqrrX9G4XkxtHi+CDbOd29uGFLs5SNarmA94yA7LWufXoog27HpS8
         xt3uHX20MHgOeF9wyv0adcMKktmx9QWH0fuyW40tWnHnZSQxh3LKY5GO5ipld2lUKOEI
         SIzB8MZXgq/heqBuZnkIxJKcKh06FP9x7gbKZYT9s8N4BayGVRCuB9StDHzykmSu8sW+
         he3aXg3HLzq+4I50356hV0Qp3B4OmhgyIOEO/m47huaCLbgE3dR+Q6kwJjCJhahsIPXR
         aWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992680; x=1793597480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlujsyuCUi1kWfCtrDGOhLB75OvATIPXE/Gw9ApCurw=;
        b=mgfLkmQRgQRYvUQBdJnweCdNwSsZID2BLrTGnZUHt8BQ02GFSwzz+n4qWelPYuYicI
         QCUCW2jJt9qXgvE0ufQR7g0sqk08b8wXd+i753u3DJr7si1hG8gi7CobDhn0ECdclTCI
         6PXJefgZZlyVk98OU/qGnqd5eZs7c6YGdMi7XNR5Lb0vrmJznnn4gFrZrZRqcXW1AvL9
         ys8Qr5B5PU6Y282YmRZ85QFO1j83Xh1oZ5u3irNlrY4zmPPGNQWld9Fl4e+4gyrqMfM5
         oYedwSa8AnfTSMHpSmffE/tQPlgB18eKchBpyKj50D/E3sD+2u1UUH72dBI+ZxOzqZCN
         ny6w==
X-Forwarded-Encrypted: i=1; AKwUvByln62pyNKqlwI1tfD0m1z0OvrW3lZCTmXx1PkV/fM0mDM0jIJMCx6+ejhANkugBYlWQfRjLvZmV0ZyYV4W@vger.kernel.org
X-Gm-Message-State: AFq9FYIzUMC49KqxWb9OJZsx6iB197S3QbAmHG+i2gd9S9aaO3N0II84
	bC/cB1VRM6hPp0HArX+qUZBlE1u78nQ0xWT94gMaBkRVbQoaaqaxEn/vzfgLVaWccdavvWqHh+2
	gniSbxV3WyWbFaZ8KAtOZhz0PT8Z+nS3QLaIezNVc26kGqD2uxYE8RuaoNSfjq2/eNLC+
X-Gm-Gg: AYBFou3UlKrVelSgnXwapPA8GPiLTgKA6jYa4G0L69s2MwY1WYyep5nFAQLwbSo81LS
	OLOx1neNS5dI9/AJ8vZvhTMY7vfvBNN3X2ehDu0tdzkTxgF5T4pyyRIQf6hDeeiG+gVcOKcJcoa
	0yMORmHekmEkQ9chDyeogOmYdbCVvHaeGQEd+uzo8uZlv55XyD8lnxYIDJJBQb6uABAdoZpybxM
	GcmAuNjLFlBicq7K6nzxMV4nzDaLnY9EbSHv83iLcMb10C8EsImZmeuzFj45e3zS+x4iNdzmVs+
	wIeUx5/ARPBlHYIJnbQfbsI9ZrAt8tLKBhBMHu3lLq+efUeU65gO96uL4qL6S1q7qM9a7F/jT2r
	L8s4wqSh2ofoTU+rvO234+ucW+0eRmQ==
X-Received: by 2002:a05:7023:885:b0:149:d501:b990 with SMTP id a92af1059eb24-1993677a1b1mr11019307c88.25.1792992680130;
        Sun, 25 Oct 2026 22:31:20 -0700 (PDT)
X-Received: by 2002:a05:7023:885:b0:149:d501:b990 with SMTP id a92af1059eb24-1993677a1b1mr11019264c88.25.1792992679477;
        Sun, 25 Oct 2026 22:31:19 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm29231493c88.4.2026.10.25.22.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:31:19 -0700 (PDT)
Message-ID: <d0b68329-a784-40a2-919d-971923a599fd@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:14 +0530
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zYrjJMIm_i4IK6h3N-baa2vmQ-qgLhuL
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adee5a9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rdexUmAEWTTLP2vLS_oA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: zYrjJMIm_i4IK6h3N-baa2vmQ-qgLhuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXyksCmKs/HZFH
 PVXDpubuB/olb6JDHrd8iZMwND6EpuFsh6WHrYTEGWZIBQH+VvgnmDT80asqnk+8Eh/F/7Cg+A3
 zDTDED5BBF6O4B7fcV71cHOkb43DcVlB4ETuDl3J+g0aMdxTyWrE26BIG84XVuCjt5sluP+zZwM
 vpB+b8s0yiDpBO2IfcbuJV2Y8dUgpeH5s6cotXdZEW/5sQ9iqRhzHn6fSvM0uOFYf9q08mz/IZM
 ldTHo2tKBWtCLwS5L52CMngpbgYkYQyVdt1huC2lqh5p5GDa73kQXLsE+LthAWvR577K6p5Wkrn
 ErTTXNom+dT6ZH6qvyejhJBriX/sd6Y4Vk7gxYQVJsTWXoK1JvqIHVBqOjXxjBMVGmvqQN1CWGg
 7iytaPWKBHnVraUbmeCrfRv+n3QhJPS332gBwCwH2J3unkFYE2Dxg5+ZrGHu/JMcVyAkNwB7ogg
 jolzJCocYMIAd/tFqwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX2+7MmgOWoUPi
 WkjkeykqT+BX3zcuBqdlhiVsh/SBocu/vqVBmW60ffPUK++/08AaPqBsFtyb3qYQQ/De5tdrcgA
 saVX7pDjlSo765EtZhckrssjI6tSILo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Monaco device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
