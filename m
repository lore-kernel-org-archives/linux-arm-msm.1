Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028204;
	b=zT2OXY/wyiEH78Uw5uvoC9sa5e5LR2E+fs2zkexYVJUDyht/Wg3qw04SC+Th6USESzBD
	 opoZ2BBRDmskD4wSIMkPasS3UOS/UG0U/bNqBmqDGzk2kRgdozIMIzF8RKmsUT0qJuXeU
	 TQBfZeiIe40zcOAWe/csjh6g8TuGx/HM3MDmgpEt6MT7YVRKn4iuN8Sd4GuPSc2WR9FF/
	 Vh7LzT5g49vRX+tzcjDKxURt96X8NuvOD9mpdKYtHVLifVcPReUaHDE/bNYzcOtKuB6mD
	 Q4tjntX8lmYdvq3rJQzLLrwcLn8GkikR0+4x5ye5vOpLh1BVbZozODHNZwMV8ULJ7GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
	b=Et0FyPKqL7rY0y7Iey46+ZRrM4nWe4dxbWmBsL/h4GjU2b6GdiQOQ3BExKqcaClTiJg2
	 3z9eqzOa7U3DQrL0teYvdCYGgias0q+mg8HvQEf53MeLPCwp2XIxOOIQGKuH9bljOUioI
	 Fzw2lpTZDVWdEVGhi4uI/wllT4VWFpSp62qfXrj0XxybOF5vKnQCdoukHlstxnsPZTjND
	 d5nN2YTHpFstu16R8NgBQp5zVuvRzY9/p/KYXgTzZ1sJJhkIFLDbaFDaSan80GiD2133/
	 G878X41TPrJfaCAZYq7wW7zdQf2VdlpM/5WkTdZsBOONH3ZGjYi1c4TMSUibCOUTKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B84606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvYQ83618544
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=; b=X8Yh7B4hAj0G/9xe
	ICC4+VLiYMkTqBhIkJgiW9x2LBO4LhbYRQlByj9Vic+fdyMqxWn+RvLBQGPiJKOz
	/IJoivyTBEYmqF7B1DmHSA+r6hg3E0XZrL/+23i2OsAAjF+/e6DoVLhdKHSLcMBJ
	Wm6/xIkhUir1rcNpys8TTtrsiRBxP6VjXDHcaax3JKpFuJnuxpoPEmnWKb6tjLey
	8YTWnhbdHQdTSHkxAyV6BvuCQ1myxXsMb1uImUa/8NrAscuaeYL14xZuPXoSYW/k
	kzRez+zerfHavCv1F3JCOGGOoaosES4BOUu3xkeHwvzxxhB+gWFpGyaPCNN4vIlS
	B3LNoA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrkdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so161217e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028202; x=1793633002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=CWAx7qxi96ibgnYmEOPfuJRnb9zoK14LGae6i8hCzDNhCHd2l7YEsJvT12NLQG8oY5
         UGJsJP/+U2K5SMrMjLI1SoYBVw+g33tc1j83wM6Sa7OwbfbLTlwFWXoiY6EnmS1YgedR
         s5HIt9W+2vYs4KTow19BQypt9slUZrQIyjcSZy2UgQUF6cxsUnk86OMN9avtPL6aeYND
         u267oOxO/OpcSgbrPXi586G8RY3+QmXT1bEWyi5yCMO5MrnOUcssr0D+vY86BfT5bwbp
         Rn9gHNmIjCrrtkxVmmXPr+ge/it7M7kJjnmSNEYhBb+eIEZmjz5fuBAfUYF9I2NlSJtD
         L6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028202; x=1793633002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=XB0++UIu/IRiyRzyKTJpg8DLopGUdKXuFXrvBBxf3FsDeNUdbKdIzrlq0xa1yN3YPa
         N0Rvze0XDlV6pPzurOunpwbfcXQpU1A6hD7rR/uJW9O5926sXpKqw5JQAj55srQ56kWJ
         9OCSuq0+DDB0gbKGhUqsYjqSUSXpP5nhdXB/CL63y5O/I7OV+v4XmAbhuGgbTBHVoGda
         R+6fSLNSSmC2usHQzsNte8a9tzo2qTJOOkdqs8vnuyzqWzIR/ncAdKh2ZyFM7V0dSqzt
         /DcdGjCS2zLSrpoD2owxIfH/tvRV6dWGo7aVOje8RYfgmcYKL2xvl9ZYMrF+/F4PgMQe
         ZItg==
X-Forwarded-Encrypted: i=1; AKwUvBzgE0tJkwENu3R+JoYNCrZ8c4gkyPbl7ZHJbw9fl+t4kk1fy4o3M78P6C6qpFGBEL2mEE6iuvsdeQQgnH4q@vger.kernel.org
X-Gm-Message-State: AFq9FYIa+Wzxh+qkQ/1+Tn8noE/WU01P27uI6SQo6zqPvMnfpuzr04Fv
	oltrZp9mzM9EymSGnsx5jK+gu9USyVhWK57Pp2cd3XZA/6fVMGtUZRHCgA9olRq2/rik2S1RRTm
	g1/8tYPW8/+q3YcGbGQ32RYuCWduytna7j8PuKzLS5lIIDP+2/iaPUr8EoNMx6zu1EC7u
X-Gm-Gg: AYBFou3UiTux/cX3h+ETEj8CWwe+b86ldfs80uHXunCM1LGcEAm9krjREJyisD+d7AJ
	5EDqH1VtxN+1JLQMxcV3RELL5s0exbjJvkKMYCDNa/XjApNdFHyqbkVyM5iEJWlAZRwqJD4lVrT
	2fm4LRvlvwcVkpLD5ENoHyi2/QTbcdbL+yL7gm8080Dgie3TtcwPfskbA7EE/UzZTuI1hBdVXqa
	9iXrAQVEemqjwBbv1dmoAh2vLT5Fyg/ygTmCdnk22DGqNELIxSarJ1C2Z5MXyudRop5pFloRR0a
	Qc8CnlWB6jxmN3TtRJYB5lM6saymRWJXPBB6nUF8PBcvOeYizIkVxHYqj5eNwwkjbYoab10gDmE
	A5UNljNhmpKehWIiN/UGXfw==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378620e0c.2.1793028202148;
        Mon, 26 Oct 2026 08:23:22 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378572e0c.2.1793028201524;
        Mon, 26 Oct 2026 08:23:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8c4sm335085266b.47.2026.10.26.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:23:20 -0700 (PDT)
Message-ID: <a2477a12-6259-4e1e-ad4e-e2fe41aeae1f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:23:18 +0100
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
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
 <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HTvTtlPbs-iE4MHbE2G4wVCcJevsk0mI
X-Proofpoint-GUID: HTvTtlPbs-iE4MHbE2G4wVCcJevsk0mI
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf706b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-OgLTNqWArPnvb7kmGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX0dV9U2yksn0I
 rz+gCIynVYF5UScc9YeAHyUGjJ+rUfweR5uyaX6yWEcvxdBA0hHG35TyvSVdhV/o8eQz4fOnqpB
 eQUxhOjQ03GSDKySqhbKtxMYEEriZK3R2ybqnPw8Qp0XOUoVXJUvrxq0gtY4UmT1pNAOERoqHaW
 Tcv8bMDGpngD+wWr8lPIa8vK7q2QN6QQLSxBF+ebgr1fuzdSPazqH7a1sPqUSvB1nXrk1fFwCpx
 8uU8E9AYwCmG6zJUVllxA1VggkLsfPq+PfVehsBIPva9LoGaTdyuQkt+kOEPyoLOZBwLTntjsem
 b9aHCt4oxvkEhTXKRqZxxrIoZPEdtWCuTGg7mk6I76hpr0+ei6aNBhTV2ayzpfoWJeTWykik0+U
 Ng6HhCoHe40tyCZ3i4FwpHf/Psd+g4o/jNpsh8L6rXh7gA1BQgA+tPt2GHMlL+nnyTUPvc4ZGa4
 3Or0A+Uus/zh+/3akNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX0TdciZsJBPYm
 guzFr4M8c51+jgDaUVZPdZDyD29vh/V4ENXHFLjiCz5JyawSTbn6mYjK/R3Nn0iRCb9ZFdOLP6w
 mFtugaXn2OH8j0nul4Hn/dFigBOcD+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 9/20/26 9:54 AM, Mukesh Ojha wrote:
> On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
>> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
>>> The reserved region wlan_ce_mem is device memory used by the WCN6750
>>> firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
>>> erroneous — the region must remain present regardless of whether the
>>> underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
>>> both board files.
>>
>> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
>> matter, no?
> 
> This region is used by the WLAN driver when Linux is at EL2, and similar to
> Kodiak Chrome, Kodiak IOT also needs to use it.

Right, it's a sneaky iommu_map

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
