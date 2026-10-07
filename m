Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161C39902D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370850; cv=none; b=oHBLCOsOqnTB/1hRk5G5qBLRzYt7TDuetK3YNdX0BQ/ifbKxCXKx7MDTjbcZovUUM9Y9RPMcAhH6VCrJEP3v/hvj91vi9gF5euoaYy8X9OTB5rzhDA5pEw85u4LJX1MzDY5d8f9SYp7lf4Iqklz73t95VA7Ge32uTz4vAFTPvv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370850; c=relaxed/simple;
	bh=VU/dQ6PyuT7ZXeA2t3pyo87RFBXHOriX+IpfI3AmWwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjitwFrOgASqKaIF3hF0erC0huEs7Rl5LoVxJDeWcPbNd9l9dTVyzhc9AupxQkZZJ9pidaWazQ9ekpGy9Z1OgSRfURrcRpXy5qKguqnMg7unSTWKpU2eMf7lN+3Nbi8FBSDeRIL0hi3FmtzWGXCag0Bc4A2CXSPPzip8fbwJhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oU1AcnTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQcYMyor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU1AcnTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQcYMyor"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977kGUb2711895
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=; b=oU1AcnTuBUKPMdOX
	9jSWS530HrKrixtTyv3jinPa15dqNfDFg7UkF4MI8j56piw+vwI3Q1KmAw9K1Mxr
	WjsEdeiT1mCL0IH3bSTjABJ7mzknGXYBmCKEZ5HkYmg3bC4uXH2nTZyo/TlgspJJ
	SCyIvFNOdDcWsrRZjZ4WArTrfFZ2r9bNRA3xZFayD1ICpr8Yywi0QmJlg2qpVbf/
	v/iMMOtxB3Ar+XDIl2MCqkeMm2pgB8FCgD4QOQcDhnh61/Fhdzry/8RInu9jTrO7
	SycpXpktNObg3gZzDyBv92HTka/JRNjn20Lt9fQKDQg8mrft8HiBcD0ITOykMCFR
	JY0MWA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1sf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:00:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so4445040a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791370822; x=1791975622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=RQcYMyorVGr6kwkgU6d1UOCoRuJkSyxo26v7IO9u9n3yO6pbpvcuS1RlY0KyyW8xw5
         cIIaPBOgc6YT1ICvjXk1hs/bj0H+Kl5Ur2zI84DJ1TSaQYLkErMuG+1h6m7WspfkgxOD
         8r5bLsHK/94BtbZNv0b+rclrrQLwqovdXwDhz/yXq9GYntF1T8DXuuWjk/1OH5ZGMJ92
         hG0S70b6g6IyypNNRAFXK2AqkdgEny7IKF4tCK7aV82y7HVL5WP4zkgD5O492QEWvsoP
         qCO5dwItv2fN4C+q/0wEzpuZ4sAXXqQKyR/CbrnF8TrofrUc8Qtx02N/8cPFuWAlwOxj
         F6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370822; x=1791975622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=nV3klWLfxSPMbUD7f3f5mYyFM+EKnL34VRK3vMRZj17EbrZU4Njcv6ksnedrx+sQiV
         CHnvZwnXzf2B1Y0wHRqqoCEjn+x2h0/DjvGoBBcsAqOkIZKXpU3GpvzKV2X28mmqUcTB
         sCXTaiIK9Fhh6W7ZqKKu7srU9W8LDGRxuqGoVXQ+g9m3dMDRYOFPUD0plXLtmJMnbOpr
         eke+hR0udRfISB1uzx8WiF6tY/TmDc4knGW4EXSZ+PaQHZ/4KfINePu1OI4885maXEJT
         aQtnbq5MW/Mtv7svWy3CiKCUGo9zk2yMuhr9MathZpMCOHqZ+MdUQRw0gaWmZJvRXz5m
         LHgw==
X-Forwarded-Encrypted: i=1; AKwUvBz9KxihBRtd4GrR6IYha+MxNbAThMdbWWvIbY8i61Han0jvu/OKm7KKWBd9cAmP78VkMiOgELG6wo4MR/6A@vger.kernel.org
X-Gm-Message-State: AFq9FYKOaT8fPMaE57YW3ataQ4Wx0qoZ04yxR7Svk76KCdf2OjsWe/ed
	/G7tqBEeH/U+csOsfoBkmfFwalh2wPSfTMaX/TUCbsrTalhJgBveLzCXqsywX7gXY5FUKGu0yIj
	D3uf2NfdP1jdAJgoYoAdqJSaOyq+zilUB5SCkgua32qd9Hp8j4jf7XMtxoEghu9IZTrXK
X-Gm-Gg: AYBFou2HuCrboqAF/twKOXXk6m1gocD3SXZAf9x+A8GAgUDVeNnT/7fByh+2w3PpNec
	V0P36V1QGJvCcog9tJKkCLWbsIq+2Ofmp0xQwl1LZ1Wr6kk22Ag0hX3caQNxJym2lDkfrsXFBjL
	qbWsptYdb8td1H8BDrBFAb97RNY7T21xobBtTO29XOYc6mNR1m26UNt1gOz0nLPnfUv0gIQ2glD
	/CpI0oZv+ueWbs1fsUbtJLv/dxTn7DF9qD13qbhM4qQBl2ipzyUvhqD6N+YyFROM4WWTQ7w9+su
	VVflCgGCxEDalewiu4FZg8CB89uFcfmDYhQjkgclyo/Pf9iizOiHf6g1u3+wtnGxkoxHOEraeL4
	7HCICbpLLrY4ssZTEyQiM+/MZdSYsEYneQ7C82Qhi
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701791a91.22.1791370821858;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701772a91.22.1791370821390;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5ebesm1232959a12.12.2026.10.07.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:00:20 -0700 (PDT)
Message-ID: <297690cb-64d8-4e7d-9d97-66680f6a2b99@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
 <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AL_QLPmb1QitorMqCj11RLBc5wi97bSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX6tbHzEvYQNWT
 K/xrwdKgCbLW8P2HaX/1gypI5xFHanXJ9MsM7ZQl1Tt+4KLF84n5Mdejznc3rWKkZlby15PeEs0
 mSQGlpG3qR/2gdYEYB3Z8pUTyGqPYlpSNF4n6mit2NrO4OHYvEsn/6oznrrHHKgzz9nAhMhSsbI
 AdNDzZfJKjt8kvv29r7vJ1x4935oOtf1Gt984WY3tYUaaDmW997W8kfaMVnQ5ksjfVvEWenJxUg
 pthk6VpGHyNdeebOX1x8ZDLnAVMasfx/7aEc7ipbt+LuRb/6OFBG4eIGMbLLb5xz0dytqs+BFXp
 j3ZWsf56CCAkGXq3mxRaG5yy3kV6G7wSv8ScpDnzdli/f0qW6zxyCoH/XzKaZOpVyZmHQfMqKT+
 ziRMCgKjVhPLKcj8QcceSKRS2SA8ZnMG3ejKJIlh1Ccqq1iL9xIbTb7CrK5d8PZyilTDat5f0bw
 LOXiMaD6BE0drAOP8mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX9CmkGVyyEOS1
 8F1W185ifrLU4weWHxpt7G0tRL8ojHbU005alFwUObmK/sIhagGcZbctfXSVeFk/N2+3dUUlrAU
 5s9x5qdWLW98sjYMcSZvFFQk+z2JUxg=
X-Proofpoint-GUID: AL_QLPmb1QitorMqCj11RLBc5wi97bSE
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac62646 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SwwKY9vyf4oML-p5yksA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070043



On 10/7/2026 1:13 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 122 insertions(+), 3 deletions(-)
>>
>> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>  		};
>>  
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 /* UFS and PCIE4 share the same clkref */
>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
> 
> power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
> GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?
> 
> If there are none, it should be reflected in the DT bindings, together
> with the explanation in the commit message.
> 
Yes, Glymur SoC does not support UFS PHY GDSC. Sure, i will update the DT-bindings accordingly and include the explanation in the commit of next patch series.

>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
> 

