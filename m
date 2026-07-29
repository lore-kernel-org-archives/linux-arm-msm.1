Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396263AAF77
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359226; cv=none; b=ZWtCJpvq+C6+Z7QFExOFSsHKZNaR2ovqZo0dNoLYsr3DbyFyKKhiHVrg407cO/N46IB1zZnwGmLVpCjkNEQSBpSDVpTcgP/S4hajXH7eK3bd5lV32iRfKxebtOsavNjn8lQWKUrkW1lIiK6vGYiWFYhzvgIunxnHCLzRVaehDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359226; c=relaxed/simple;
	bh=Xw/5ZltwCtw3AUoZIF/AG/UvNI1OOm1dwK4rjeX3slo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f48IAXpFxgp8t83WJnl08yTQPPnUE25a60dnil+deK1eOLx6k9JG0SU9WDXAIIM+Xr9uh3R3zylYdg7HApOt2qjRSbNuKhEg7DEQB6/Y8fBlGMlKMHxLL21dNDMB9fNnzvOgNAd8p92JujtHAvNH+K7BoSJIpxT/T8Qnu7s97dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pujv7Uq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxrtT3zC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pujv7Uq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxrtT3zC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL6b5f3174982
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=; b=pujv7Uq7ruBhfF1t
	TTbOYnX7Rn/pqdmFLJNmUKjBX8N6XRmR9Xt9AjTa0lio1+I1mTUTgFlByd6DOHhH
	A01A7E3eRZdTjQoe0kxAZBfdZ1LvLxOP34dYmR+MQRlsP3H68hPhHiD7OSXT2anq
	fUxQJEI+MDwt9Wk6iXeqo5gqIBQPln7nXjpfPn9/yfVZXIEWCaX/31cHHtxQg7Ff
	JxlL/598jS0+Re8VV50aKl9QIFLwRVbv3teAqGJISnsS6FnzNd03xnmfiM+dzzSn
	rIXJlwb5p5bptvSHqjypp9FkKUYUq6P1bgULYsZfKvlTnWpA40kThwPerP1RRqj8
	J6NmZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqs4u002k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:07:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so6128515ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785359223; x=1785964023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=;
        b=LxrtT3zCkmbUOdZbxoUDn3pw3hq3lj701WMR1d+6ILEAcGwofZixhf9IHLTR80hHjL
         NsMCfg+DBlB4BhaiaVSURKqxi6cl/Q7p4i4fQfE5d1OL6ewfl6AYmRwLGQNKM7NuXuK7
         Qptos+nushF8Kp5J0rYvRUTRiGnFdn1TvXRkSrBDOl8kK1oWrt2dGVRqvWpR+WaP3k7J
         A/VtD1j4HIsljSGFScQ5ZRWIGcfEi8aYnPb1nGTK0VMlPaCH7qfVxebWOkuUKqJCyDHT
         fpY/BnSA52TiDqb5dIrHDxUDyjJi9fPik5JnnUzbUhe1aMCvx1b+zVc+TMQ8/8KkbeY5
         DAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359223; x=1785964023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=;
        b=Ax/3iTZ1jEXq0lmMJJH3lN1F19b64fU3Hy1Q8nmJOjQZMjOgdCwewcfunWVdfExtfH
         u1bgWVghfXrFYBi21D9q2N3lgKuJqpoqQh7DkSfRWME8Ss2SAz6Uoe4FsZtGEspPs1AZ
         h4dRMbBJ72zJ2A9Fhq/4EKjubPKeUU+/nxsyWDNGhhyRrPeTbez0iI+Ob0wmv7/CfW2+
         8/fXNoLyVkgUcdGBhMSzepPBZg9wSYQKsFhZLJs67RWzoaP7ri/esXE7mSe8Sgg4J+dd
         c+e8yMCZiiDTk04O3+RIWsN7mTl1SaVhVFRjiyN/31YzAtgpf/e6lmkP50tEWd+KaO3H
         EsJA==
X-Gm-Message-State: AOJu0Ywxo1arfelWnDeP7BgdTZNFPkfB0Ps5XAqOzEGuDHuNmeIq4jUy
	Omd/SC3d4DvkwnQXF4Xv/064Swc5wPc+i8H8mvEUQjW0YnBZQu9AiVcANqfYA6UHZqN+WW+Tjpy
	9aMYf1iI+6f6yZQ3c0zbu0a8xhfIUct44KBJiBZK//Ip+IRHOzIfEh+Pxhze13ceNxM+b
X-Gm-Gg: AR+sD13Do9xaQtTUENRy3xaNMH+VEVh/Dp5GbW3gZDZEriJKZV7FImiDfZyJxiRWAne
	D02D9msA96rN6QRzS6kmrWMf/6zdeuThrUiRh3K1ynisswYa5L0on8mor5L/CfmHY1YICmXeZGn
	PlqLCwbA4lqml4r2WNlh3rrTWGUZuV3FiilrMaaMHe40S26G1gcD760zim+ry70YJ2EZFtgulwH
	KCca1hnhRim4pL0wrwM7MK4InIqtIzsE3fBQHS/FFxaBdQqLuBmEZyCC9lEnvveashqRnlMDATb
	/O0Hbxxe5bRIDtwbne6nG8yvcwDxU42PTXl5qPoiW5c8asThwUjWcyZwbniK5tKz+UWOiM9hg3/
	Gw0dca0lWtGTP0Sh7znFG5DqMgGEYGM5gxR35N6dK/f9uOp8fZPmyrA==
X-Received: by 2002:a05:6a21:6009:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3c8aaf8d31fmr10052345637.10.1785359223021;
        Wed, 29 Jul 2026 14:07:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6009:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3c8aaf8d31fmr10052303637.10.1785359222450;
        Wed, 29 Jul 2026 14:07:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm24048005eec.22.2026.07.29.14.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 14:07:02 -0700 (PDT)
Message-ID: <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:07:00 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mani@kernel.org, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1OSBTYWx0ZWRfX8DUL3vSGp4rZ
 H2qI8Ekh9MqcngVs5q8IDonbENYgLi/nQdfBT9GGiA35UaQo/FvFuKLs66IGnVN9Al3C3E7deJ8
 9HNCeUQy//BzvVwED0SwKa8CVsYYz+sH8nfsF3o8Yqw7xmMTEq45XuFp+oRytb/MSLZDRRNkMjM
 3bNOcoubiynZrcBnJOj9V7AMTK32PWq76JD81+/1p2iMKZ1d0akbUKIolMv+07Y0uKvxpg9bAHw
 bs/le5mj+/mtdzYIATeKa7ImsOVROVdA1BdFguyc8/Af9ftD2zqUA/COKWvpHf44XCpHe0OBF8M
 mMx/Wotkj5gk4xy0O+sjfxCbspImsitkXIIc2znmRQ+PzxO6uJwvmDuvIMJFmaxo1RUGzSCB2Rj
 +OJqTQjaAg1zWsL/32sTOQTOIKiANcH2wnCJgX6Sgzbo2prkC3NZiMGEjJe1kgk0RRvg8oikJR9
 BCXxTTXXw3J4T3++uvw==
X-Authority-Analysis: v=2.4 cv=EIU2FVZC c=1 sm=1 tr=0 ts=6a6a6b78 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=nEv132rEWRdaR2lrs_cA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-GUID: HrEI1Jtt7LgPGxMdHG6_kX1npoUV-EHV
X-Proofpoint-ORIG-GUID: HrEI1Jtt7LgPGxMdHG6_kX1npoUV-EHV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1OSBTYWx0ZWRfX/daXtUcjiLmj
 SWsl/7G5wMd9e+7UoVYusTP3z2U2IeEkoBUjUd3g0k0XBxaCSWeVHj+BJnH39zb58Vnw3J2C3t2
 L5T7Geh+TJIAC5FRMXhey4sDuP0OIDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290159

On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
> mhi_soc_reset() tries to reset the device by writing to the
> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before returning to the caller.
> 
> This may lead to the delay (if implemented) on the caller to be
> insufficient, if the posted write doesn't reach the device before the
> delay.

Interesting.  Is the delay tight enough that a few ms will possibly blow 
it?  Seems like a poorly defined delay.  All the devices I'm familiar 
with take multiple seconds to boot (with some variability due to ddr 
training and thermal constraints), and if the reset triggers a crash 
dump, then its easily tens of seconds.

Regardless, since this reset will either kill the pcie link, or 
disconnect the SoC from the link for a time, I've been trying to figure 
out how this change might break, but I haven't found a scenario, so I 
suspect this is good enough.

> So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.
> 
> Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/main.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 53c0ffe30070..4d458396233a 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>   
>   void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>   {
> +	int __maybe_unused ret;
> +	u32 tmp;
> +
>   	if (mhi_cntrl->reset) {
>   		mhi_cntrl->reset(mhi_cntrl);
>   		return;
> @@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>   	/* Generic MHI SoC reset */
>   	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>   		      MHI_SOC_RESET_REQ);
> +	/* Flush the posted write to the device (ignore return value) */
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> +			   &tmp);

If you wanted, you could fit this all on one line.  word wrapping for a 
3 char parameter seems a bit silly to me, but I suspect this is highly 
subjective.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
