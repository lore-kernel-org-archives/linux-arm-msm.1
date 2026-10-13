Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68B44F68D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894742; cv=none; b=eimJGPlOacZJqhgW+62/gVJxk3fvJZicJlNzKm7fegVNDnffpJ4lmRHw85VYJ2FAP4VndI27uNXKVvqnayPcA3JMxo6PzwPoXC5SHZE4+bDQFpgcJQBcToyHGNhDfBDVU+4t0DU6U+5/j3tJKTe78Wh3+YkscRJ1Ll1Dud3wmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894742; c=relaxed/simple;
	bh=LMxmRYwPkZ4VA3zDeQfgyLZ77W1DooNovkdvC/BfOrA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bETxUMAcy9Erq7qblQrpl10IXYYAOAglhioPiykvL16N9QzVQXm6ubBj3Twx7iG98vYFY0ydZWu4SfS7dRrgtidJdIypi6HajaVOaSketsB03V4jnaqJ5+bzfx6l9+A2nYtpTZzSvxEoKolE8ctacrGHaZI9JJRlw62p8HXUEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z62ZcJFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2gxwuFH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z62ZcJFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2gxwuFH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8J0WY3908171
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bwlDIzABmx26GpdoIrDnXxWVxUFDmEmDBn42B4tYqk=; b=Z62ZcJFgab97nr72
	46IO+Pba8a0rgvk2FglUTIAsr9eGqR5ITaaGl1dT8FstMfVQ0krJiGz9pzfmnxUJ
	v3NvnP4cDKNF1q5wyp5lMqmtsXnfbkHfR6Gb1BlQIqhGvjuQBBFlTM1wZliINcIE
	RNKnQ6ZQQgwOpXKHA+ZhoehoHcHTpWRFMhn8BddjvXfSLc0JzhTKri0yQYG2az2v
	A59IG68jBtpCr0z8d29OIGA/KBTHLJi2ZOXLZhO9M/RiBeQ/pK64ca2BaXA4B+PN
	B2Ej7tMNb/vU003+2aq4w+jRymJF/bkAUfdqjRSffwFAymPeFh5WaFBph6BaZwvF
	7VFNJQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquhc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:32:18 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6df316a1a62so3910239eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894738; x=1792499538; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bwlDIzABmx26GpdoIrDnXxWVxUFDmEmDBn42B4tYqk=;
        b=f2gxwuFHb/w718QM3jUkpphtxh5d9UH3iyUpfExd8WmHBXhHgRJah3qyhmD/Jzem16
         /FYE6nADied0d3gsX94wfTIuVrTgdJukEtIH4nvgxQvhoENR6SrYTMAt17nQC51cL08J
         Jjx2LE6E8hSi2Nd3MDoTMrvd6AT1T5pKd+xOBcmv0DGCOgLoOpZzIi+0GWud8Q7mWPxw
         N0QyftaNTy23/zfHDtHbVSd5mgsMxD2Di0lDjc6eFPpj8zx9Z8ygGm8fRHWqiPWYqkHG
         QI2z9gmeOq1139zPr0M15VB6dLg2LTEsMSLgRd5k2lP1ljIh8abq+RVPVoAHZSV7yAej
         ed0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894738; x=1792499538;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bwlDIzABmx26GpdoIrDnXxWVxUFDmEmDBn42B4tYqk=;
        b=TQPikeqRvdj+vjq5GUk+x5m1PuBFpKXfBojSPH8w+dSEYGW2ba7DA0UwfeeodMzFz+
         MnAiUSHvF2qmpvN+kdWWkaPhVjtn39DkSfkmhXYjPiJQV5oxVuDOXQ3FxdDhY7zl6na+
         kBSnOOrOMknR9/jl0ai4CMKeCoqhbcTETqH5d9DZwVNs703C7xPVGdD27km01i5SIOjk
         9mpl1kOO3TPKM17VnsiFZtDcZKNtMhp98EJtkWf4hD5JXYku79v/p2nyfWo1oHex4Sw/
         uadflLNLUpjmj9V7t5FXTRHPOaWKPZP6UP90n7I/q51V5tqJS1HpoWzAsx1vm7wf7Wvq
         RPGw==
X-Forwarded-Encrypted: i=1; AKwUvBwC1SN+C3UV890TXPDLd9oLGq1hi6mnFGQcsb51tqKna/ADqCLcV8Mk9CXyGciz4ivUnhY3eXi7voBIFAhV@vger.kernel.org
X-Gm-Message-State: AFq9FYKi5JYWnJBFU2uacc9qiaADrxJjwsLaMZkSUtIHd9ufZeGZc16n
	XjlPPR9hPkapnBxOMYOoo8pPBcyopz8Obac3p+3oHOm8UeLpPYIBVJVn72yQc/QNjEbjEoH8ITL
	8uFJ94swYNyI3CoEXAduY15wSNi9dFyh7JzJnnLej8G9gIIwz5bNlkn20KwT7nurxV76j
X-Gm-Gg: AYBFou0ryijBzcw4oE1AO+vNqqX+wjWF49YrkZ692OECEYlT9WH+aprMeffee2Axf8B
	jWt7uE2ezyD0+EMQ40dQQVf51MgnAiywcxSENdpXVvob7pddELsgMgxSSHtYar3tVSSai0vSpXP
	pAEDa4FpjB34riAJgaVY2GP8Y3puobjM69jxu3oyyR7vpxHOKBb6ggs0htrzNFDlCf9bll0EOfa
	O3KuZWKVXOcgwiD5C5WJ4Shp/R/ZJ578fQEc67gu+q6XmYK8VRZaehatAFseTvoYynKa6NfHv8N
	VLQXx9KKOzZYKYev2U3Xqz1cScjyxKH7AHcg60/pRUVMUYU4ocEDvXyCRwCxKNwuSOSWw9hYQM3
	gHlSuY4AZiGkjE5DSbS2pHdslUOkCgxeV1/eKvGab9QszJFj6MQOG5Xfd/Faz00PQDywEbytuvR
	e/CgroYYHXX5Lm/V/5MoUzEQ==
X-Received: by 2002:a05:6820:16a5:b0:6f8:2e98:cfe3 with SMTP id 006d021491bc7-6f82e98ef3amr2856042eaf.10.1791894737961;
        Tue, 13 Oct 2026 05:32:17 -0700 (PDT)
X-Received: by 2002:a05:6820:16a5:b0:6f8:2e98:cfe3 with SMTP id 006d021491bc7-6f82e98ef3amr2856029eaf.10.1791894737524;
        Tue, 13 Oct 2026 05:32:17 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f8a470726asm2918402eaf.3.2026.10.13.05.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register
 using readq()
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:02:12 +0530
Message-Id: <179189473286.2132802.7434637844183959510.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791894734; l=2402;
 i=sivagupt@qti.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=LMxmRYwPkZ4VA3zDeQfgyLZ77W1DooNovkdvC/BfOrA=;
 b=jtD1ydQ757M62HHGgHv26DiEisgbo7gh/AXF9jUbWtPuEhU+h0aKGsqWlyK0GRYeIeEywxhM/
 fzMy+HlFxhOABOaxhYrq5xSFoCrxxGPvnMsqbd4tLKzEpdfHTZtGGyU
X-Developer-Key: i=sivagupt@qti.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX1jTgIWw0OxAw
 9UtIM6H2kckZ6vQPopfKliZAcy1YMgLNWU3mGqth7MAXqiQXsQi4MVBkJdxMI/n60ykSxIglWo/
 gwOVDwBMnWEOCDGaJfpWaqcVkHAIxSS1yDoR+I9GPF3NoUMKE8JT/0c/GI0paOT0q9ukL2XaQ/F
 020w+9bYc7BHmMfJ1hzHyLF8uPlOsH1DX1gB6299yt37MJkchwl2rfnEh5IKiXSavjljbRjSMF7
 KC2eOxDae1C7F/7pyvyRAwmqXBSZi3x3Ss1AhQVI/n3rR3bad5Xu0EcuXMXvgj35g92v/syW5rG
 x06TZARzDnDRT/M9MVSJbOD69iYnXGz9XgNcZiIQw5KsaoSzBGdoZ6fdkp92kdWBJ2+9VibZD4H
 SkRuAlkKKEDyLvyJ3pBz0BlscvHw70se62svq94UwI07DyTJDTAVaxOkl45ZNrRaE0YhquRGf1o
 pDb5SYbmghHd9VqLXMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX3wyUjc2Q1Ad+
 CQ7ggJexoS8nsytOAFnzOhORPgRJtg8DTW+XQUEry6SSWHFTtwL7CBNbGvqZzk9rI3/MMFbevr0
 OH15OlpVvccCwYQcVEtwnn7SgLQCgNo=
X-Proofpoint-ORIG-GUID: zKLfz3hPCkvZnv3Rwa667nQoi4goMCc3
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace24d2 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yr5CLtzNskL00s6ajqYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: zKLfz3hPCkvZnv3Rwa667nQoi4goMCc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
> > Mailbox hardware registers are 64 bit wide, but the interrupt handler
> > currently reads only 32 bits with readl() at offset 0x4 (upper 32
> > bits). This returns an incorrect value, while reading using readq()
> > returns the expected value.
> > 
> > Use readq() to access the 64 bit register and pass the expected value
> > to the mailbox client.
> > 
> > Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> > Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> > ---
> > v3:
> > - Removed references to an out of tree driver to focus on the incorrect
> >   value returned by readl()
> >   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> > 
> > v2:
> > - Expanded the commit message to explain why this change is required.
> > 
> >  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> > index 862e45e8fbd5..0b584d9aad6c 100644
> > --- a/drivers/mailbox/qcom-cpucp-mbox.c
> > +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> > @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
> >  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
> >  
> >  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> > -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> 
> This still retains the writel() later on

This is intentional, currently the existing mbox client(s) assume 32 bits
writes instead of 64 bits, changing to 64 bits here would require all
mbox clients to be updated to send 64 bits.
Currently there is only 1 upstream client (arm_scmi).

> > +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
> 
> This will alter the indices of the mailbox channels, but it's ""fine""
> because it's always zero for the existing platforms..
> 
> Konrad

I am unsure what you mean here. The channel registers are spaced 8 bytes
apart. In the old code, we used to read each channel's upper 32 bits
(channel base + 4 bytes), in the new code we will be reading the entire
8 bytes.
If this is not what you meant, please let me know!

Thanks,
Sivansh


