Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184907;
	b=jl+0/AkXGJL8/OrzGXbuVf4kVR5+eoUhyBB5YKwqSe+wxNKaDXcWiKnsDOIhwaQlaU2F
	 N3MJ8bDVU/aE8WMDBueE111x2FSba9U7s5CxXP22PEQ/n8FyWoUANTSRWJoHZD1azN7TJ
	 igjpEiv6iFbGfUkrX5REMgEuIwPBhQPQMQvRZhkPoDKGWsAEYSgkz6ii/VVR5O0j/dylD
	 XqyAr6gG6bD8r2Tx4KkuaIiLrZFEfu2S2sQ127eICSNkj+W7VT++PKZASZNHWqu6sWup2
	 dFGS4GYINSsTMRDunCQ8qF0ujis78N281MY5zbdjy4/Q914gklzj28slyRSTnWJQ/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
	b=ZDoIZE0CknqdYeHdKTMeerJ66ZOrWHeyYjnXxgMGFSWrMgYXdl4Fz0yHiLvsGEm2u35I
	 SwI/g8pmggs1J6zp+z4ezAdcQ5rvyaRIT+RyDCXxz4zWRYIPmk3OnurAubWHE+Y+EtRKI
	 auLwU+xick2umPFdI4oJZIk0DQL9esQ+vH6FFTA+sxXGjWlRYT2k1PhD5HX5kkYm5BA97
	 jVUKW39eR4noIcD82MfQT+gakBB9y7TAsoBQGM3Y5PRNe15UP0Clr54UTGszGNDcW2sJ0
	 8OeQncsTFlcA9fLJ7oozfbdPAwCDcx/+goFoTPDTFZfxOI6Tcy+YdfZqFe1i05A+4Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZTe6TtH/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8403606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8403606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTe6TtH/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KBFP1667715
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=; b=LkHpxOTOYlUHfJx4
	m2pWz2moAC8FSgKdhWL8dLH9HZH063WrDP2GJVcoYj9j+G2e3MiWdtAKzZ3jANtN
	nrPq3kHzAO+v18Y8pSVPJwxR19WGifUpF6k9ODQpKeUX6qDZnWsX8wkKag3purRG
	fR0smHR7DNQJvnVx5Iz0k+jjkLABZewOxaRG6YxuDdOliubxiidVvi9gojGoAZ0F
	95OgeDRQsyv2V1gH0cnBp40QUNe9FtKosmIb4m5eZkxSa33jbYBE4RZIqw/VEVLf
	JpmqGfMJz4vYAY4NZpDk2jXHorQtKHOF5FEDD2UI3IyAazoR0dl5xBim0awNxSPu
	uMBaRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pu6an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3080133eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184905; x=1793789705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=ZTe6TtH/HBt8PFk/jhdzrLVkWXp4wjcchQPiYAKG4FyUdSxjjnzCuXLZux6+7ynlIS
         RGcTqxaGryTrN6MAB1jMv2I8obntPLvkWvJvk0TT3ZNa5nxcMQdqXiF5DiQeoayH8mJb
         3H80x6yhEJrp9dDYN46kZmlLhUrhQvW6UJ8cuNdMdgWZuScQ2ne/SoErYulP8pNhdmml
         14pX8J0XdZHRdg8ZqtouTXOSXEVLyBFl9IP5p953WDLNn9jisD1QmMCdOSTjK/76rYLI
         /jFwpeDtHdU/xN+r74WWxZOOZQGPK5A0JV/m8ITxIGwdM6uHCaBY5Wr+6l35rZIpY+TM
         1mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184905; x=1793789705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=q37+wh6SdqhpdVx4nNrMLu5R0Do4INe7l+TEThb6X4I/Pckv1HgHZ7S4vG6gpy9YsK
         fFPGngT9nVtH62dNV8bFIoasrwLnGZUZ+LrS1pEo8SeVH27dKdEJ1DOKqySpU6GUZtid
         dcQI38LhyPLeFDXDHt1uKHinrVy61JQxW8vqdzGCxTd0L8kyH0wAjLE53By6ux0YJpyd
         9OamuCtMuh8eD92TcNT71YeVhTWMlmXiz34vJ68ra1vca4w2/bFRUXy5hsbUwt8OXXgu
         h2MvXBqdfwdxhxBJB7vGLxAlbGEyLzuOyTDI6EpoHCcMMBISDXdHrfUo3zaoLFroslGL
         6BOQ==
X-Gm-Message-State: AFq9FYJkam6I4yUoNQEx6HIZ7D0VAn0oJNTwFMQrTN+Mm6V3Zh6S+OSP
	h3b4YoFA3H2qdgJl8XakLt7UwhIiw6Rbz0XcUA0F97Vb3FSNelvAzCHQwZpnoN4tZc3RpMzZwYg
	VziC/o8LtJdeUvurz/d0GvCemWS+V+C7aUCAzSGluFz25SsOUwKiOQUJ8rf1yPPiCXBrR
X-Gm-Gg: AYBFou3DIvJ7TxVcQhL5LMtJ0WtM2o0RHXwvsQbdDZK+XgiePPeP1rLCcPqk2LKjWPg
	5XZwWZS9vW2rSbcPAjeVZzrPBPnfz+M6KeWIaHVgHMh5/UyCP1eR5a3HpPbxiSzXTj5WdSIHboo
	vxcezhk2umM7GWEQS0SuRNQdi9vJ2vKcxiWqdL5TSdWs40BhnlUWlHFgOz7IkRQsv3I5yUgo5Rt
	6oCoIxeVoSTBC2f6L2A2hbYeP78k/ons7ZReqwQlyewG+L/zePm3fZ/Vq0eSHKUzA9uoH6ZcaMm
	7CsAHBU94QKZBQl+TovB7siMfF0yRL817JJM52Ty/wqsUSRXF4Klimk0cc6ilB/bbluFKuV6XpX
	WSKsFfxxrhwCVoTWA35KbZOppGMSz6Hg7it21gvMX6z6UtjnGbq8EqBfarGn3mkcZu9eVoROoFG
	ARE4gwvqvSMQKeXz0=
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393211eec.1.1793184904740;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393162eec.1.1793184904020;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm6335086eec.9.2026.10.28.03.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:55:03 -0700 (PDT)
Message-ID: <1dad9241-45c0-4405-8d8a-2437125cf8da@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:24:54 +0530
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
 <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UuhhDDQvJ7MrQ9d5EbrKk44RsSrNuDzQ
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1d489 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHdet6GdWXRFFbjuATMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX1O+AaLxaltFh
 5Xe1vgToXnRJAoJUKpfR8d9ln8Bj/3jsz2zmHmMXeHE8M75y1rQCDSOi/kNNVjp3Ck1UN+X6PpS
 b6IDRVr6DhHbLJ6oRGDp2RTRDNEwRc5tDD6XhVua6huwkBQ+tinUeA6uFfsb19UqWD3aZW89unu
 YuOTXhzvre0/Y3lyJ/LX3QvSWKygfNrrMISdVPFU3bss6o2XKl5RSW1XB2Hqll+AmG2WsSNqG5S
 7P4FkA3QNabbFjOQ29P7MnE6MqFXKKIBn+6x+u8UyIccAwseoWZJ0pMocUkE2u/uRVxlroghuqg
 m2YS+dyl0+5Dbp5zlrABHs99IJSaF1al111cQosnfIDiOtTNii0i/i2Q2NbYgTwcen+2iozfy59
 +agUdBJNUK0efgzRmP+B1sT5Ghci/EJzfssyjkTkS/DPimklKxrCQTnKfKZ9GT45cXqXVb8Ab2D
 yfax8uWwf3xIfBRuvNA==
X-Proofpoint-GUID: UuhhDDQvJ7MrQ9d5EbrKk44RsSrNuDzQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX/f7BaMwY3M5B
 wvmyH/ffJs2ppOJ9iEBUdIK2R+f13M/bBI/k90rXqdaZaXouPBfZp/TXKx9JB414UXVjOJBZtap
 4rw8G/VVJYdFYEeW/EmTEImJmeF2Rz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280043



On 10/23/2026 5:25 PM, Konrad Dybcio wrote:
> On 10/9/26 12:35 PM, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +				opp-201500000 {
>> +					opp-hz = /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
> 
> ^ this should be svs, not svs_l1
> 
sure, i will update in my next series.> Konrad

