Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529263;
	b=36MZ9lck8SwcuWenJ8+goNq7A8tdvTOZreQa2umCsFRq8dxyTvdxi9DMfn2tc0S1LquU
	 VXL/NSJLy+zox2xLAbzQWGXnyUxkHxVBLngv/XY89gcywa72LpBqGuQ9fAOw540yT1aWu
	 4EyPEWXbD29qE9eg1NWuOU9Q7iF2/Yp8YLR7qKPKJ2H3YR/iDlIcoZImjEgozK/TWFxqr
	 KpzMVK25SmUUmRI/ex5pQclfxNSTDieQY9zM1uYlLlFmksXszEpmHNlqIN9K86czTIZYw
	 jEKMLGTn8QI3V+clFKE4QAFexN5Y0zhdTLAWnUbbswY9L5HEoWaoojnW+dxQLKG8C2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
	b=pdDWAHhJizrvzj0N8syMyFDvUUmYYFcnY55pSAe0iXt62PU7w0P1jrSpP+JzpfGNqiZQ
	 6ZEZ6Z5NiclcV8prxweeEzm4IQGSZOXzG8IZ82Wle/YR96sObdmwXvq+iXtOAsvz2gqcz
	 SGW3p9sDikU+1FTrWWGz4Tb4UrO7INUEaK7DevVraD7RoKSvrMJamS5LWxoY3cTbGTobr
	 CbK3MRtZRWlWB0aEVCrb/FEzlwZFyMIclALm3qwOL4DnNMkITTdva1gWgLsBaU6ivI1MJ
	 PAFzPjecJKR4n1s0lqiQD2uAyc4pa6Ns75zIXErpq5lxszsJ35wR427DG157PWPkpSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N2wtZu/T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmlVz17e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BC0606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BC0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2wtZu/T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmlVz17e
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KHZWbS852940
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=; b=N2wtZu/Ti1khupw8
	0AJI52C3hmauPvt7qec/n/1uMqUSp/eK2IUYDOtx/p7GThbUsfN2kwGe0h+T2PlU
	xJGx9gbBZUnhbm+4cbQ2HTbg7Qdher3/0SwEN8131ZieBa7EFtH1PiG4oM1TIBQO
	JFVc9pOtecXWv9XPMJ0PfkG7ufFB3Ye94+F+khl2P79YmRz5q8AOtQH1Mme+P3vS
	eztoj60h6h7fK2vjj+5KQS652WBpAsVT6yccmORBg2F5IlchFRnCZVzTBIObx8vR
	g6rKdkZM8rR3BLpQA0zWICRErErTsR9cZj9coaYfDqopUHQYBZiZyQJow+K4zTgo
	zL8+JQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hva1br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso53089c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529262; x=1793134062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=ZmlVz17eqvc5tzOBlvPuKDQIH4xqcbioNW6O9KJBhxwhd0GqWt8rDgMOTKCDx4hAYL
         VmBeZkmBt5cM16vnfgFlfJJdf/hHauhnOhaiqNV+RlgGBXKHCAEnZcvLY4S00tUEGO1n
         dDhxwf72WY3JZ121j+zfUPzWWcfyJ7Jl2s09lOuo90gtHCjAovnhtmWHSLGzV7fcUucC
         WoY5jXulxLBXlxu5qdyN/JdPFVdVCUlFRejA4NvHHeDs8lH6+GhUnwobyG3gPlyHGR9w
         VG772wOlIqsoFwHPjlykz+ZPFv5q/v4bWPekKjCkzeyX+uCWvmXnBkBjywTsajkaGvx9
         V0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529262; x=1793134062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=dgAe+5bZDsEUqCnkqWoG/Lwo2ln7kf3SwNW6qrLwiaDAnqgTp/vw4LmJdbs+eHL+aD
         4CU2ahDfCtegB19ZsQFrtI0VVhmWM+gvnvEnIEcsOYc8uQD/Wa1epKoyaKRS4l6i6QfW
         VJwpg1coCicUiRtoiVGKspqZ/k+l9rdbMPp+J0VyLVM5yPKiRZMFP2KfDo++ql8XeT1a
         Wdxoux5n/b7u+kTkJzxZ9jeMJuL/Nx+1zcoio5d8F6iJrEIMBMoR3Gp1fP400Y98zHpa
         39hEuX8MMPH3xdHuqljhFuUnzOCEwxOg5AwX4STI3KgQ8R2m1RAkHbjb8UvhtcrXxlny
         H4yQ==
X-Forwarded-Encrypted: i=1; AKwUvByVT1oFOm9WSQmHwcGTGIe/gD8YSPulnBDL6vZbO+XlL1dK6E02GZqVohW8RNbT4FGYfbW94DKXjk1X/t+f@vger.kernel.org
X-Gm-Message-State: AFq9FYLGhLWgWnes6KsBqHwwPo7wBDHpqkdqKs1G3vCCJrjxlAEAo1ZC
	IQmZuw7JuYIGSMNXirvtp/dyw2ryb3K0POQoBFMKs7+Gav9dJBV/jAzjWw5PTw8TQBUPpsZ0FyL
	TvQeLJKmjPwHLt0ZUjXZw171gHGGkAMLtIx9soFJhq6vp1bKnX/87DJUaewkUr0Bv0sN3
X-Gm-Gg: AYBFou1lYPqqEbK264FOVRZtresj1Prhu6E4nHhxbzfEPXvyzDT/p5sNTN8oF0gteax
	ljfDbLAyM2lNHEuenPu2riJPyZJCygXi9UDVQ54Xy7mpgKq6eIgoLGB2yFxdzQ7tz2rAQ112yRh
	Q/QG+oMjF3FSho0jN9FQrIB81qzxFWzxj0de8g7CRobnB7UYRL7TFA3mYBW9k9V4jn+aN710yrG
	nc5JtwdcdmfWYmuJ8r+kmq+eaPNisgBYzwQRYwgYge9jyuZCjBiEIJhtiTU7qdK7/vIAoe8JZDK
	ETE2yTAqqk7EGj2JRrrV2ScjZTYi46LDnPuxsGC1jvF+Wkfqff7khwJ48M0WU2WAgs0hAi7zN3Q
	ltl6CMIEFZJ9PkEbUQBTtlzPJ2354Cr9MZqS6CVr8sHP6EoUp5grePzQHHA==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991543c88.26.1792529261597;
        Tue, 20 Oct 2026 13:47:41 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991437c88.26.1792529260407;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm880701c88.23.2026.10.20.13.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Message-ID: <624e580e-3d14-4b3e-bd63-9137a63abfa0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:47:39 -0700
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <qLjQvei0fouaxpwPTn80Nhf-aITowIXFteQ3i4M6uq3PVYim2WLaeukVq1MgNcwOeagmzK7HP1tzQbTTlhNXOA==@protonmail.internalid>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX5bcjacfWbPLI
 +HEetl/42vd083xw5NKw4t7n7z+bxIJhy7wjz2XiN6kqp5Y9R8pfwj1OVrt0mWY5DgSpMbmcEcw
 iGp66NMhPjp7J5y2xExtnjuH+KNkW90eoDnGF0kGxsMFzz/OT3plsAe8KPQt+qzLSj6O9LE/s37
 xsYq+DiuTyA1NmSbQr4lD//ijgmBH8V2y9KGUR8XWBDUg2ogoxfwF7/jrZZdCruD1wBMWJ0HQEo
 MEefa08QOjSNaSuwJJJOhETpEmnoWeSe/FFj0tW364IT1IduniyjyppcU/Gt0tiKZL3l3O7aZMU
 C88yef6oKLBZObvv7HcQlQ8TOuvQsqQry/0i2sjGcZKl9vxzSR7WQ0xVZt8Tecd2lVcEx/5r/rA
 mfZS+9ymbnzDXmUe/hvIFY/Gm7LWJVT34WOoqokQiSox3BLkjDCjTaUX7jL4UGSCDSE97TYFaPi
 Nz2GWNW02olo7rl096w==
X-Proofpoint-ORIG-GUID: WxH4a4CLgcVbSj8S0dNqq6GWbbDALg5g
X-Proofpoint-GUID: WxH4a4CLgcVbSj8S0dNqq6GWbbDALg5g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXxnKKKOgdnxzD
 EDz8mWInPYoMkI39tcyTqmq+cqbSK5Y6Agh4z+zbTKloWuEAA8shKbs5aEzwdnr/8YtmsdkhxAK
 0a9xF7jrupW/oVr/DbzTqSXw7BB+OC4=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7d36e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=z39C_I-LsHAogVuORkQA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

Hi Bryan,

I agree with you. We don't really need a separate file for this. I
was just following with the series pattern that you posted.
Can I tweak the name of the yaml file, which would be more generic and
can be used as a single point of reference?

Best Regards,
Anusha

On 10/19/2026 1:29 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> Do you really need a whole new separate file for this though ?
> 
> ---
> bod

