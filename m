Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748236;
	b=aX6WGiHUl0Y8MecNw0S3vlXCbxzSKl7Jqu9sXreYXPvO4P2xoJsvxy2x1ywrprkFl6IR
	 +SK3Kgo0X/csPTyPM0TQG0zNKTeOAZiJCda2qFRFNjJMbcrdYT1Eg797mtP1lthXoro12
	 wiG5xzlibYsINwrcz5U/0kZp38W4IPj/PmCaArlskk++nlIC/br9G4VxlwB0Ms8I3N5RR
	 LeAEgwUXliXJRIQVHdTfZJVr42u6ZuQqPsfTsJnUaC3g2a8Zt0j30C+MSoPcaw0ycjJuD
	 8Fm8IS6wJAEnb9rw4Sd7T+jZIxEpnGgCz4L+Wi651MDqqQPgBenKkfckCjk1uaxBGSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
	b=UbKK6e9epwV4JhCH3VxVmNZHDk2klTYSUw+aTbdk0yH+X7O4x0IMTLs7ab6BGVl04SE4
	 RCWWSsHfMldzkxhvUqxLKBOY+mO3AisTckAGZMomHlvpWhCtkD62/zvch3fpg8HsLfWkT
	 zHi3KYBbJzotq2+5n9wrjTRUyXVWz3vnjSiqauI4iJ+3jk5xwn1iX0saZLfP6+tbdM2/T
	 TSCCXo4U1tXGfXOR0UGfkdWCWhXP17j3ndh7bXT2NdkULHhusJbrrJ0o06AJqtj/1ffOU
	 MyHd+xmriix0tHRkdV03fwOj0s2rAn20sHd3hbrEGvXtakheuWkgcemdFQnjF3FFATQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCOwcxZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ4+80En;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF6606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCOwcxZy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ4+80En
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FBpB2092791
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=; b=BCOwcxZyeo7EnaSu
	EyLA5DyH3FioyXZKt0nqvQ4PLcOfe+KQJ08NjWH2uFM8ubEy9auudJQwotjFl4Wy
	VN40n4oLRt/upUeeSJon7tX1WxzusV8rl7v2tp24IZy0o0g4uQaXv68QPvSBGQ3W
	UtL3t836zzUZnDlyrtjwx7V4vapmkWW7CEjPIVewiu0EojtsKlVlckycVoBerEu8
	Fa/kDYMyfl36iz8NTHei7dB/d9wmSrKWpZ1e8N3Uza7nxWdjKYz6d+fNbuykBfBl
	kCyX7feHObdRJi4+Rh1KQP7wo86Gvh6r2W/Ajy7/Y5+QVLZxhTvEEyUa5GS/axoe
	506lnA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyga7c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:37:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065e2933fso931590b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792748233; x=1793353033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
        b=JJ4+80EnIb+5jX6tyq6ALwmMBpgJLqK7fs+Ym69i2+BC7OqNxPz1R+MFGxW3eLyjRk
         XdT+Ds6zBVpG/CqqUc2OqcLQj1nNRaF6gYznfPiUe+2EAClKDTeIFXRVBzFQ5iixRXvx
         3KtoCSQ6GuLYvbIcIzN4G5SvOpx5aaQK8dgnZvfYV2pMa3FEkgUvypQJZAaeEbxnr1gX
         lBM4QDm+YzRbgmIrGagX5o3hMSIC0erNLMjit3Pswtx9hwQrGwIuzqESgjE8RqWORPR8
         I62GovkZSEKkHq9IWTvGytF8RvDeFQo8IJaW4zSD/npIvjD+CK8Y4WH73sX6q5398P3z
         cmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748233; x=1793353033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A/hiubLfovf0TfmFThVYJL1M1iagPS6Nh++o400qLk=;
        b=vIWjpOOuykA5e6WGxgGRZ2kB23lvJJr09vrP8K32p0WCYBWx8q2bLj0VI+FqWwAfuB
         j1OO9+uvOsCfGPJE80ELrVKsGAMOHlKRRLzQ7LQao1JnAcwQyU7rudCP/Uz+vPHTE+UX
         DxQdzzKu7/gdDsdCmHShEPjxZXde7XJG8boHhwTU1GWMektcwS3ECWg2tLv3XDuzoILS
         ZdLSseQFLoE84GJV4g0XETUgrqRaJOhPacQDDv0mUuMhfgHHUOYXge1RozqWXV3Hy73x
         XIakYiEsrelLLrQymULuAjqu8j7a5dBPjaIzod306z5/YLK7HbU0FXbawxlpx1Tkw3D4
         Lm5A==
X-Forwarded-Encrypted: i=1; AKwUvBzyY5/JnE7VafNbg80y60NluWtAHWVwxjijFb0/KlpD9ngWA24tCRl3IrpIUFiZf4Su3JRG7XfJ0bGWkn6Z@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4aAf616SMy5zPPRh8FJDGTzWX4CLxLPoVp8r5kH+MjdV3zIXE
	O3R5o+OUEneOefsf4ilD29qebyjV59+el5A2CYqK7HJrb9ycXtTyGeXnvPB2JitOB1Zuu3SDqpN
	Onqw7Z5o4+ZG358gq9OL8iaothi8du+Ef9BpQc82TpRy0rifayl/H0u/ykFmYHdIRp+sv
X-Gm-Gg: AYBFou1NeHmkniXZv/IO+kXpON0LT+/oziRe9iZWArGqMfwN3zmVb5WgnCBkQGxWJeL
	rlpcu+fy7xQycT1BYMqj0RTeJoevVYyG+2rrYbrYu9zbr6s+V/hS2ewKN8CeFJ4jj1J1HLbsy/T
	0WFZ0Vuk2ikoXdx57LYmXakJtavBJwtYolSc/lg5gpgScQRjhH2ky3UWHdePXs+vY68VKywjq8q
	UysrzkRow5dmbbxywmQYfYUzKMPsZc8nxhUUSv9ARyx+ggV2+5kIaiSoqluag54LozeRIt8qgZc
	YztIbMyUykriRfxSP7ZObRPVihSeSx54X8CDEb40vtQCGrKIucpMvnfad4qqacRoy50ye6PSaT4
	KPqCswBkiVnygTMXsQHe1b5MMTySkLrxMdXgFVkyWtOt2xc6ZMQFExGzQUDOf
X-Received: by 2002:a05:6a00:390a:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a2c787c1afmr1496053b3a.45.1792748233091;
        Fri, 23 Oct 2026 02:37:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:390a:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a2c787c1afmr1496014b3a.45.1792748232524;
        Fri, 23 Oct 2026 02:37:12 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8dfb7e8sm538052b3a.36.2026.10.23.02.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:37:12 -0700 (PDT)
Message-ID: <f713be3a-5ff4-4157-ac87-47a19e3f0a86@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:37:05 +0800
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb2aca cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=-Nk8vmC4l4_uGId51r4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX7J7OplLLJf/m
 JPPIlfpDZeo+1PuDWIsOav921Kdnryz0RedekqbyOiqFgo2reac67bTqlz8yBSmNRhDRRFrxt4H
 r8TCvBMLKnU9J34ynVFH82bbXxrkD1A=
X-Proofpoint-GUID: 4d7KdBy4pC92qhlyrENtmvz2-LXtYPcQ
X-Proofpoint-ORIG-GUID: 4d7KdBy4pC92qhlyrENtmvz2-LXtYPcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfXw6ZwWDz652ZK
 wYil+0upPA1UL4iRuLuz4iwdqj+YXn1FLxoIQPnilop1kuqoecimR/10jlXDATKTyCfDjB7yC49
 EPbvph5W/gZyZfTO62wWb4OIb1U1gBFkFl4/27fMAFoz1gwFPmIWktfG+4NHwNPXBqV9+9KeaZ0
 S+jloq/TM8L1uTC/VICYwXuMZWoPcFnayQCoFslU0BhSKf691l3mzmMYttb5L1hLPx82Imp/15n
 iku6lslQrChL0qV3isdljRnnVSyiHAnpYskJgo+SDRBaNILDVSRbHYTkOwbu5/5QsmoKmJDlWEN
 M9dr4CRHSHWf+Xn6iwMloLnD03gy5zAv0CMmwOkdva2IBo5Y1k9rKd5FMwmGxjCrsAyTYmpLo1P
 FLZbyagyJO0RDcqG+gWGINQUaOCqVEzH5Ld7cuFONCf3UWyLAk0dW+oMGEm9KbUpU3BUdHB2YEy
 FRtBF+8Acg9fIFnHf4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230038

On 10/21/2026 10:02 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
>>
>> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
>> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
>> lane mode on a rework camera module.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&camss_csiphy2_in_port {
>> +	camss_csiphy2_inep: endpoint {
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&csiphy2_out_ep>;
>> +	};
>> +};
> 
> Please define the endpoint in the SoC DTSI like the glymur submission:
> 
> https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345
> 
> [...]
> 
> 
>> +&csiphy2_in_port {
>> +	csiphy2_in_ep: endpoint {
>> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +		clock-lanes = <0>;
>> +		data-lanes = <1 2 3 4>;
>> +		remote-endpoint = <&s5kjn5_out_ep>;
>> +	};
>> +};
>> +
>> +&csiphy2_out_port {
>> +	csiphy2_out_ep: endpoint {
>> +		remote-endpoint = <&camss_csiphy2_inep>;
>> +	};
>> +};
> 
> likewise for these two
> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Hi Konrad, there is one subtle difference between the Glymur and 
Kaanapali bindings that I'd like to clarify.

Kaanapali follows the X1E80100 binding, where data-lanes is required. 
Therefore, the endpoints need to be defined in the board DTS, following 
the same pattern as Bryan's series.

<https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org/>

Moving these endpoint definitions to the SoC DTSI, as done for Glymur, 
would cause dtbs_check warnings. Would it be OK to keep the current 
endpoint definitions for Kaanapali?

---
Best Regards,
Hangxiang
