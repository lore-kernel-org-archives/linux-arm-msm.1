Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680420;
	b=iHUF4mRk/TWpO5WWNuEYHf0Kfn04d/5ciipomg40suSvrixxq3aHCNg6WSYovKamHt4d
	 GcJkV+7qqBSZ2TI1fgySabUCNXaESvZpPORygOx66WS7ZT6xNUP6iTDRd8FXBOp1Pm1GD
	 YpnUZYkPCx+9ixOTJQ/QDhaWR7VhJou57PxP8l4PEqAmIX4UdTfKEgdwunU/6JtN4pu99
	 /WI9eegtxXhA+EHRRgtOKUY2LTsmt+hQ+hP1h1oR5C9oKlbKELcX/AQDdic2TCvFIPSwo
	 jpcTAHoOVecdX8a79ZScDh8LheTKNMFtb2lw9QwPz/zfCc0ekEHETJ/68VI7eCE3AZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
	b=RSr5Ykc2pbIE0uPIynJYdL67TiXHFzjMYfEyZZGqQvPXuaKf8VBoTvcvXkZ6c2W9M6kI
	 Q0WtL95ZGYkkFsRi0q2KaDyM42kaBSlZazwEXRkb+zoKyVCnuETbv8qTAiHC5VIOW69lI
	 BGsf8tHk/XPuD0LJpKNcoQLI0J01x011d4FMSm5FmnQj2hN6vF7W21nJ95TGtdhc/pasJ
	 v8bOt0uX64ncDvjD2Obg5tk5Bh5D1ZXukaQ2R4IQOE8u5cbBASchL8OJGECPrC6ayeRMf
	 mvCmz1oRzLDtuY7Qwv3mUfTVXdDqSy8FHwL7dGik21y545bwVfkHyup+cCeN5pOKFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22359606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22359606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Yk1682489
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=; b=cuTiIGukxXzABDFq
	jqGVYJsu0iutdk+Aa6KvmZuc0na2hHus0NXjieEI2uymsQsFayLc+UEn2Gq1OA/s
	sdNInMq9wfq6081GHTNTicfbLgYlVLDjnr+q7nElF7hoFnmuVYxn7c71tk1MXwA2
	umispOJGej+tL6KnYZcx/bRG2Cclgt7WYRUn7WFF+3CicgoQLPSLQhhFMi0oH9lI
	xtptUzDZRGpCe0WOmX3s8MaSlLNJUxJOYNNuPJhLuh+bv4kLdF6kJWGNmcfmjKpy
	3em34HXZB0x2cFpDQ+DhqplC+xYKb9FfRw/S28Rf133ijOYCYRx40PGmMDCcdwFs
	ewBrJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aek3qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:06:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134a35ec9so5769476d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680417; x=1796285217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=DRGxNSFWBGOg9sPyUtsxLyaRPwh/ftLTEJb9v5yoKK1HPhWb//hEygsEosCdRQZJn6
         6foNLXPthmcj79cqGnpuxLDRlPSU3tWRedK8vPynAhyXWqZEskz+bbcMDgXEzZ/CUmJI
         Fzi9HEBWbha22gRJCX3nIHTfkT3F+b2hd03bJIYXLFakPvmGKKu314cNdq2C+nyWnl6a
         KQbvGv/TJbfXVNDxO7FogF1cG0Oi+HE4Nwnqxw8GGX1H8hLsGd5kArFcyREAo1KSopq2
         pAIK6Qn3XRO6iub3eUbLOfe4sZrpUVXHqmEOE4EOn/z1lo1Yzs8EFqMyytGomCUZklXr
         G5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680417; x=1796285217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=eRDYFZkUNeuCLJeYugbkplxS4klfzi+CuEQt02bxAJSGjC6PZYG8ItIuNhtg6xUr2Y
         8/HvoPzzh+kf69Qi05GjI7nBqQxOiEyoba6pd+QIKwjR7w9wiAHzXK8jwDUjjAqQ/sAG
         TJW+i7LsgIFDbF1Jwa1sLckfs478IabiqEOzYmAVYwicP0KCKMKbjf2koDnaGurknA1H
         wsBT/Y8MHTKBFDs8+hvVspAoGEr5M8U0z+2si1pu7X8Zo8vw1qOHZuL2z/mAL4cTm/Rn
         rVTC8r61Lv2EF79VHkYkL1q1+I1SpmwR8j9npEf48JrvTXKKG5lH9cUcwdbF+0NhJdJ+
         tzgA==
X-Gm-Message-State: APuU4Z9GIX/vXgnDIuH5nT+xZ266oTGTwoSQDpARWY851REq9l+Yglqs
	Eg6GvkGN0l9e+JvV/4VZFJ5bAEXUO3C9flRViY9GdnPED59iO8xQ1LVrxtQK/hX+wwkjpeA37zY
	dlWz2Zzw6wZtUxEI3Gi3CXspUzSIRiq9Z0qT8YCtLI0AUq3oW19DzfaudAz4Yz2tmcRJQ
X-Gm-Gg: AZFdTZeDfLf8cUmky4Y8RYdwCMrFB3onSV7ChuD70b4lQcNYThCibbtCwX6/QMu3Qwo
	2a4+an7ezBafnnXVZyQUt1E+vOGeXz4LCuSlXYdT7qPHTtxwSYw6wgQWG5sTBz3Ohi6nTccrtTF
	r62I05TW4m0RjOASH2loAcFbFRu0yWqcmYRoqCNX3M9pO1/5M9pU97tbsmziDOhTL15F93d1eOG
	6FCuaSM2AfyCnVWbcodSVqGVaKDCkSA66Jh9a3HymE+Xa3fP99goagQa5mDLi1sCSeD9dHpEoqk
	kNMJhis90ADijnnvmf0HIw4qIa2VVGuAqczY0hYAuOEQWoQrDL6jJK3kpgDCRHuA+qA16+ZI5bu
	3EJDCtfsX3bDaHVnynElKhFT1lw8qiQv9kjZIzBtWqJ3MVg3z2luIsWh4XqMjxAzFe52XMJk=
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759676d6.0.1795680417029;
        Thu, 26 Nov 2026 00:06:57 -0800 (PST)
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759006d6.0.1795680416471;
        Thu, 26 Nov 2026 00:06:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm743942666b.20.2026.11.26.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:06:55 -0800 (PST)
Message-ID: <9c634c3d-0d74-4ecf-b9e3-180c2d602862@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:06:51 +0100
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
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX/ZwlHd9uEHMu
 iiH9fHaKj/suz5sf2Y3o4wSB7u9TSSQv0FrLRPOAfyKLoTkWmY0vZnU0Rh7EklVdDq9xX3Wcv5v
 fxtCrWQ3Yvv5CymXpiIsHv/DaOcdJKcyLn1pUKvZP1iauHGvTBuWSP2lvDEhFvDTbFrPNQyASfv
 wuanEhCjGF9yBHwlm7/lFffGgYA42oCqXry73jBD9kvNnlCywPQcFrc7PowmvHu5Nx5FLz9cWYU
 9eKH1jORm7Znq719BPSNjVDFSOnL05k4ytckM1YkAiWRZNYKijK8/3w6nD4OnIYcpfE09nCT6Hg
 2IfSBQdquSKOSe4rLaa8GVU4Yd41hL3WSr5zy2/ixpbXXb2Z3jV7jeTUtbYLF8beov+a+2+ZvL6
 t8oa2EjT5JMiJLX9PzVfnWTtssK3pGAX6ycajm1XXcueW15YX02BoSiPriZNhq6AAnr4cbcF9Kx
 B4gFxfZYIihDQLOzywQ==
X-Proofpoint-GUID: plZ4pZxG9MqhpniK-5sWrKiowKoC7FPT
X-Proofpoint-ORIG-GUID: plZ4pZxG9MqhpniK-5sWrKiowKoC7FPT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX/sDBZHpc+6HL
 as70xMH9YmBAvY7g/fdnQUTTAu93Y/nTegg7mtDv0SkdP+XO1TQ3eby1wSWD83tRVXvQIaRwkUG
 mEFMK/VZcX1P2kqxCxOa5H0ys4axwYI=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07e8a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=QI7CjI1Wg2L04FBskPYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031

On 11/11/26 5:15 PM, Hardeep Sharma wrote:
> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=1:
> 
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
> 
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
> 
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
