Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B445A3E44EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561039; cv=none; b=gDgS1Syo4HB6ztpSv64ztI4+Fi7rW3CtU0R28FQ5LZc2GGRsLuUzpQW13gW9r+yaEhkD9aihBler1xHsiZIy5qI7m5rBdBc7VZH8i4tK4eSxFWgb8UZjpt/nFeleBs7/4b0itLYMEiISkPncmZeLfNzo15Ho/fg9f4pN7DzKM4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561039; c=relaxed/simple;
	bh=7TZ6BT5J+bgZTyuXp9ni6k0112+91YFuwxbUPLAtwJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CCK9Ri1Yq4wp6CTdRAY2qQYWtYxhKhg3BL6zJYFSUq/9P7eYLQpB2OHIrrOB0RuILfOgz9mRQ9XbDzd1Q2YUNhf3fxlUZkayP1jMcYXSdz+kzyASXuL08gw/J4Cid48aQDSpZ55OHS8rrErRPtuUvQ9EhWFVZrUX/xChOAeXDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5bevLhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWehpvG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5bevLhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWehpvG1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RI0I1008598
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=; b=V5bevLhgYzSokvPY
	REZMyRZEE7CeUm5xxuSwFkWFgN4+bRKsPjQOP7Cx+mYXYDB8tPsNMnTM6WIaEHsu
	IFMBZPYPyMUgZVTFHMAhGvarxRrstHN2N5sQIIKIchu+0jcEk56UFMJ42uEEWK1a
	Tbj48giRj80NAkv3uZp/Ur6HCQZMya3vni/qC2VH8EaL+3t6jekzEzz6a1GwqR1H
	thKGnvv7CwSq3VfQjdUC0hdi7jGK9OO0HN86ZGD6vS35xFezZbHG2XAGuPCUcgzX
	zdBEmmX+zp1LnfO6Jm6+gWUls5WxeFMkeZU4wSH8KGidReQ5RnKHGbVlAtLAjXCR
	yrRDIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe1nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:43:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2988774a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561036; x=1788165836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=;
        b=bWehpvG1zeLyxDeBLPmH6Y8xtcEPdeqwBYvQWUmw3kPPvFCBsgZwRBrjyWhUokRcKN
         ZBYzi2+oLdyabvhAyaYb400OMhoLHXXOcdxxtVsKlwtq1zphCVgGWAEtrWM0/vN/PsBl
         R94gRecAVIR8SskwhkZfiWEdxRTpQG6Ease7NMnjE2uGTaSv4Cc1iIfa5ycMpPxglwEQ
         35sZWWW3knfIWiHqD5S2bP7fvf3qHkyiS5DB2OPmrgZYEjYrPRChQIevPZMxpFffESBp
         6hXX79GHFRtVFgt7lIn36DzkGMqBeQtVJUh+5NmKravPETE5dv7cWTzY00wrGIJQe9b1
         bNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561036; x=1788165836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jT3A+uuNEEx2wO3bX5dlnE3EkGmrkKO4st4GcQ7MV8Y=;
        b=MifmvTv52Xbx+ph+BPq2V7lJZFC7iVRPsB8uXiXwxyRgoeGa1qAmuuXnwn6CeRFkj/
         55apRS7wfmDtCmsvtg6bx39IpHtlYPfRKXv0iaslbRP2zxpEH421eu62CTWqZ6lC2Vz2
         5H8dO1VL+vaAWnkH6Yo9gqUHMPLziecLbhUuxzEpFUeRC3PLjRklXfLMI6dyJ/ZAj16a
         r1Lh9fMzsLuot995U4Xq1NbY88VCumxVorRw1C5v6PnCjnC+Fvh9nB4T2/xuc6pJ4v31
         CPtjChz86T/KJaSBXfKdIDMMttbGazS0oL/x59iWX60X9La9ruVVTGzNI5bnvC7rzdTF
         7I9w==
X-Gm-Message-State: AFuF++l6yke9zsJzajn0El5zftRAiOmC3EjXj7T1nMDlsFXuA2D4zcBV
	leyQsw+hdh6bk126JwgSbqpCOpfbucGwky5PIB89m02Uk9/WMZdGqG/yNdeVt/9HQA8RMCkOZPi
	P6dMADXboO6i2KFHtnah8iD606bAemmd5Jhp2p5OcQEgC5BSMLcI2cz5vvCMmmS34Aoy8
X-Gm-Gg: AR+sD11Qpq4Vpd8TlbDDWaJ+XYucHZKgGMvDCMDuVz7OYHllR6mdq6xFwa8Q5lIdz73
	ZqD/fGqUoVmHxBlA6viiF/+/siOZ9X9u/ujO0DAsTAOb5gaV52rNHSA00HgNo6EzCx8TaWhYV2m
	L07J+jMdyNgpzx5zw4u6XZaTRl8A85nGcIfi4aRmP1rdjmFAvH2emw8oXPFC7bix52JNhEzz3yE
	oiuF+VIG5x94dVnZUqtOdYkWyhBP7x//Z/+ipeziCZjYiAjM/8ewqDdyJs8bu2mrn/16saJuD7i
	c3ozTdqT04kAZD/TxlZKHxH08V/jggKUfc3WjzjTv+VoW42ibHTrqSCTXdmPFxblaU4TimVcCZq
	ccFHT3CpFVPcqr17l5Qjybk/03IcEaFM=
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr22803812a91.3.1787561035804;
        Mon, 24 Aug 2026 01:43:55 -0700 (PDT)
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr22803768a91.3.1787561035341;
        Mon, 24 Aug 2026 01:43:55 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm9226982a91.13.2026.08.24.01.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:43:54 -0700 (PDT)
Message-ID: <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o5-U375cstZ-IlnIbPH4BxhIeBc5Jto6
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c044c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9btBknafKP0QppeIf9oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX9Cu9FF0Alo04
 XKudCTH1nxTgJ1LUX2HqG48nPLngncG4CiAUlDrWK+EUgX2IZbFe9+syP41FL7dwDoGP7FHn2ir
 g5YhEBtOIK/k16BJ+cSU+jUM28E4Lt/4Jh+v4M6WKBaF3R5+45l4/ev6YChh62p51d8YnRIKsuM
 zW7YODTmgnc90IbavMempbXw3pErXigoS9RZ/7g9fC/+RHLsIRgp7l4d7h51LvHjoBF/Gl+PFLI
 5D2YPDD0iv2uWO93Et2WgzBWx88qklQa8IHEkR1U21XL21qkNPF3GyS26Zuo6Mc5EYOqtk6Eoi2
 m+1F4gXRPKHaZ0h5PlWaqJLM0vJCAnKpGgmQGvZGaxJ8a2U+yVSOVbzdnLvmQj2/tYzUOT99D0J
 LyV//asHSGbPVp2DbR9J4ow6954G5JFqPdf9LttBm0cOPIxdyHmjT0m0EJmWjxhNTbV/UOEJwP1
 4A5mimTjcWYeQqp9kSw==
X-Proofpoint-GUID: o5-U375cstZ-IlnIbPH4BxhIeBc5Jto6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX7OX5nVimmoWr
 LXQ+K1OjvV9DeBtCpt2/EgBJOsuNB008rg/FspGTFvmPt0mSsT4t3+gy1oqYS9LxJsnGTc7Ua53
 48FMrIf3/7nExusnruuldywldQykt2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240076

On 21-07-2026 12:43, Kuldeep Singh wrote:
> On 07-07-2026 12:41, Kuldeep Singh wrote:
>> The series is combination of below 2 series sent in past. Since, both
>> need to be picked together, combine them and send as one series.
>> - https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
>> - https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
>>
>> Document and wire the SDHCI to ICE relationship on Qualcomm platforms
>> where ICE is modelled as a dedicated DT node.
>>
>> This series:
>> - adds the qcom,ice phandle to the SDHCI binding and enforces the
>>   qcom,ice vs embedded-reg modelling rule,
>> - enables ICE for kodiak and monaco by wiring SDHC to the dedicated ICE
>>   node,
>> - adds interface clock and power-domain requirements for the ICE node in
>>   affected DTS files.
> 
> Konrad/Bjorn, could you please review and let me know for any comments.
Thanks Konrad for review.
Bjorn, can you please help in picking patch for v7.3-rc1.

-- 
Regards
Kuldeep

