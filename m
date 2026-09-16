Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C96330662
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570162; cv=none; b=l78A9H5gPwh8HOFpLo+bDzFNbNYTZdADgORlHKZ5QJbWA0nkPe2cxRLXdYj3/WiwQ/2891gwnuTE5piy/D5OEKJm87pgN3xk4ki+kHCD+t+sAwSwiNjBfLFfDc/YHYyPvTjiqqT5JArb9GNdcEfoCziM9arDxzp3bMkzGt+acC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570162; c=relaxed/simple;
	bh=ND+1deEgYvcG+3y/HizuVxmy9BVpV6lq4ejnNITcrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr69/cSPUG8f0muvPwP/w0JY8nQUAkqUh6l7ibq1xoEehdPBnrtuGB/Uo5Kwm6IoaG7UMIa3S0p10dAuYMPNznIE8ZQnXwikhEdrS1Hv+K8Ppkyts1YJnSo8R0ETCgKFhJH1vpwCfkOnYw7HRFof4N6NzwibINW8uiSEoKZThSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2CHnqjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXand/Q/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2CHnqjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXand/Q/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYoKF2956026
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=; b=V2CHnqjgat6GNaGW
	PUiSEBlK9OoycpqiH+iMn2DtXGeysLP8DOfPagpjh3clUXFrf2P3DQenl7zPA7n+
	/hK2pcewtQH2lpSn4Jf9TPttzNfyTvr3dFaLY0jC1bh87cDIXHaWFk8IcqugaQ6j
	QGKfpKex3zeYRKsgZH+jjQ7ZfXuNKX4oNh0V4uy/RHIFYJggz55ei6QGumBuuaNs
	e7XUHauS2GaFjIRfE824O63zI4dqe7wj6AP6wnw3UkJiNm+Ovl/uxC9G9SKVvG+W
	3X1WGWuD01rHOMxdjKs+RxU/bJ5FSeeEvQSokZvPvDBX78rBeQxkVGwLITp71YqF
	hNJOEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2rc33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:49:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so4348600a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570159; x=1790174959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=bXand/Q/lN5QFT/rcD5qMfpZnm2Vt3egsHYAtMuY5PQcOITeQuXBqc3sMQ7e3HJhVx
         PhywfBeC3/hZS9PNdnbB0v9sKXtANr77FdF8EoliJTut9V8sptejPZCDXpdL604nSH/e
         hIWVri+fXHlq4ZttBVe28u/qsJlPpVBas9QpWyEl2ur5G37iltviqA+SC6xZCBF8fIba
         3SzVO2Rhmmatf2x96GuyeNYLagRNkPEBZoYVWLeO9rAdTG2M5MMlJAqJWpiaHbnGZXYN
         oeHDC2TuQXMHc48eHWPYb5DjFEfFwYOIe4XNVjwW0y8C2J7mO4/yrJhT5RicKf/bV9mi
         gAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570159; x=1790174959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=Gj6Z/oJmP6BdzhKvHw7uwS1/9lyq98VxV21ZzmKJST/Rpx7todZjxqfuEA1kTK4HcR
         dosxONASQCI2BoTgOm+FWPkoPK+R0rGz8emOMzjOda+RcxURowW5VjId7La7/hZoGhm5
         Z/oRCMgH/limDBFpB4GPE2es0wXaVbMNZpQb7ZHeHOvlp6UMFrCZRA77mIGE+XUwnAzD
         ktyjtbkkeMQKLgmgiLdlpUJoyQlIZNF5RNGyg1Sveu17SRvuBotRBUimt7bidvgGFlC8
         HB1LjdXDK1P7FW9zX2I0GDbDX32F/uS6A9O1XoviIWMvTW2wobshpWe7HfBr+MOvEeqe
         icdA==
X-Gm-Message-State: AFuF++mAlsNp1AdnETkIq85wBqCBo1QDlLkEh+FBjZb3XZVgEiqrEe8e
	vSvx2hym2RTewJDek8HaHz8MQnfRyoYrD5F30kL61lxA0O6Vfwuz5Vx5RbeJp0/NCtXxkg4iF6A
	A1YFsDBrUVSLAnNYcxZEHNFPy5duq5htZl7VoU8OI8mgRNLc9F05FbBYKnO3rtvQf6HeA
X-Gm-Gg: AYBFou3a/ZEr++/3+neNHqQHricVBfNf8T3rnYUugle0MWlqKkzXtywYLZtexZkJs8C
	TxJjAJV8wk8SYYPOO3+nSmGDoORi0CdVlDMhop7CHsUm8UssONGnvNQE1Em7iOiQdwP5l06lSi0
	ywBGAcfgZjtWcAZKfgsHVY9mEwyKc3WJ2jLSWC/7NUl+0q+V16u+51+t7OOCP6GiUx62OFahve1
	Yl8angrq8lfdPdHbSn9IhrTeYyOEb2FTnvJOlF6y8IdtVWLSg8sOQR1Q1ZFY8E4+VKmTFzRN43t
	vhX5tu4uhGVvJEp4ZkVg6buyMqYbMef0MklSYGuMc7bVZVKGnHRZdSgDao3QkZIiZRrg8yYFIn4
	Naa2qVJD9vniv6wAbNHYrDHQRiKApUf2IwOuBIWs/
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913685a91.21.1789570158617;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913598a91.21.1789570158156;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm5493700a91.11.2026.09.16.07.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:49:17 -0700 (PDT)
Message-ID: <6f5d5266-75b4-4f65-a19e-8fc27ca9d3ef@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:19:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
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
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
 <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfX2sUIFSfTxskd
 Kwi56SaVoNuXwycSLhYyym10Y8LVvQV4EAfCRzFBNIbxLm1uO46jhu0O62Ao3C5h0tt5BopD+A/
 DZolJ1MHZf1OL4n55JQq4wWM1symf7M=
X-Proofpoint-GUID: LvMRwl9mscz-7wwev4NSF47JKX9qLeIq
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaac6f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z03_-bexLPcab5i0-bQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LvMRwl9mscz-7wwev4NSF47JKX9qLeIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfX2baxwQSVJtH5
 J6o3Ko74t9a6WGy4ReN9+kZ861klRSeOJ5McNrDsb6GJPWer/+teoPmDH4rzOwGvtktmKLU6ovW
 34e5E7Waypea2Wa01JQphmqNhJwIMpYhvl+RyyUr2QzUMYT2WadSmBzTAODHSHD5u5unJ99/0ET
 qY/cBXsSol6jvGsP8Nnmf7O6r2y3wMplK6oZrea7mFdKkQSdvvNJHSd96IO8kt/D3W6CTZjYY7t
 p9JH2f5ZnJWLPjpipA8ZuMRSd562BNMfyRMxvJ5fylMV7S2DR+5MSw8eGspGZNve3P1T/oQZuR1
 Us8n5aEx3Hk7oZfpwJScFGvF3mSfby7C6tWCDe8ZRcRPQ6DkwjZ/TOZ7ivFOy1oEyX9oKl4+qL8
 n7uM2KuPEQbhbp1m2jNcvW8p79saAJ0WdrRAt81Z6w3uYOXcsCooJv+drKFqyvnd4WrhgpF1MY9
 OHlaoZpwhVvIAhuyWoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160201



On 9/14/2026 2:44 PM, Konrad Dybcio wrote:
> On 9/11/26 6:47 PM, Pradeep P V K wrote:
>> Enable UFS for glymur-qcb board.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> index 17d8ff3aed23..b6e384024dff 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> @@ -697,3 +697,21 @@ bluetooth {
>>   		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>>   	};
>>   };
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
> 
> Please keep the label references sorted alphabetically
sure, i will sort it in my next patchset.>
> Konrad
> 
>> +	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply = <&vreg_l17b_e0_2p4>;
>> +	vcc-max-microamp = <1200000>;
>> +	vccq-supply = <&vreg_l12b_e0_1p14>;
>> +	vccq-max-microamp = <1200000>;
>> +
>> +	status = "okay";
>> +};
>>

