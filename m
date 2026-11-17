Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896726;
	b=Fzy44J6v6u6KhcwsgDiLVZ4O0/bFhewhfATsMElhSYVcJWBmd9Bzu2qGYOPn29B2Njil
	 BLpliSqmMv9cVwLnPGCuHgDPUXiUrPcP/cEGq4KOTwncLwfhvpyuBsxYBJMGzUI2kuv0b
	 3FejA2QeJq8FkYRQ96fIdKeGS3LnCbopBQQeJPPvPQywnUM4KvXClxmAmenBebpWqsAbk
	 onli5lq8+wVg2ULB5886Z4v5SjEm9jrCdjFRmH6aKh2Tj2hup+PQkoMPcbOvDGbUvnOJ7
	 UUwsFdogN8xIP19gxiXlLYUoxoLyi7RcIZFpYtgHwJc4Tf2+nCvFDkn2HDaXAjKFmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5yD+WOgs/w0UEROtpGaM1H5zLUeHVWQoG0KCTRfw/gg=;
	b=QwfeLSXgfjDnDMjWHJ4UvE57Dt600CZpwzp2gL4+c9TxqKYRB74MCIBd4QSKse8Inpuy
	 svjswaXzwrxCS9Pwu/dSB99N1L7GxwDehCYcX7oU/mdgP4FxBPiO+gOdfErZhLn9l5x3a
	 Y4IQz0x4i6jL+4p7WBG2/xQoYNoxfAIJGhTC/ZrY+ewswzjCdmbqnnx2v4EDhk5hUeoRY
	 +U/9FTFZI9Lnmj0T/XDjLx23u0z4+j8DsqnCz0Fj0bAuO3oaffU0YGIZUj7ZYk1LcyBhk
	 lB15MTI0le3cOU2ehRk5pwyrZ1n7EJEKBvp9MaOop+GAbNLeh5MJUEw4YP9Im7NdzjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbyetD6M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PlRPIE/B";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5594606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5594606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbyetD6M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PlRPIE/B
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aF2H200048
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yD+WOgs/w0UEROtpGaM1H5zLUeHVWQoG0KCTRfw/gg=; b=gbyetD6M55TyiFm3
	+stp9xNsuzewD6E8kFAsyawp5FF072tq6NjzsIltJ7irOevxHhCSj+ZmW9ZZzb1l
	zrPvgKQ5RXuPXSd/JDUiT0ys6YqqDTbR61RHq2zPEi9tiOu+i3OQqyi1JDbVLg9d
	5HrxoW+p+U/eH3fdc0kHyW6cwWTJ6mqhlmpqLhxFWchN3xebtE4XHvRzZ7+AY4s2
	W3S/ajc0vQbZMgK+IXbts6rotjdK482j8fv55Tj0lnwTwoFsrJbpCKnKODVcP6kD
	u2HkI0ZdLdSuCYrqs0+ePH3GlwZRx11H7b9glala1Np7gOkLzJn9UMqkv8FFmM/9
	Z/AixA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbb67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:25:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so5558408a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896724; x=1795501524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yD+WOgs/w0UEROtpGaM1H5zLUeHVWQoG0KCTRfw/gg=;
        b=PlRPIE/BlbSEjGRRF3p/sf5Gr75YyDeMBhFr7+iOMzhXqi8cpoVD8XJ3vFo2PInZLv
         rPyFt+mru5NGo4boxHxjr/oHKFXKr4YSROjz79eGjJAXc9AkTg456CHzAzROygmUT2mq
         JE9VCulQSn6afpm8P3BTUF3kMJZbyEWdNKVSK3l/c36uAj7ORHiS6UQODEwyhnlxzALR
         QdEbR0woB0ZMn79hgBRsUmjzDIX4h2tVlxx7XG7o227I6aaSfMajtOJaQ02KYWrsnLyb
         4eao2jFOzq4nH+q+jrTjtpPOAYuxdFFBz/9rp1d4sXW6muiF6eqiFcn0rRGcGmnxCXLJ
         ReKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896724; x=1795501524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yD+WOgs/w0UEROtpGaM1H5zLUeHVWQoG0KCTRfw/gg=;
        b=vp+6c+WSH/CURoTKvlP3bKWmY0ZaoTQ/am5bSu1KXyrczrpDF1m0gdVEqGwFPJsGKx
         zg2KbW1D5dwUKp/pI4bTaf/h2TGMnnTOvqN0JRez7BteJS/hPQPHafSoCFwBOq+e4kIp
         DmmQ/PYqYVGRPRel+QdThwY/Ni2NG+Flk1JkISZxkc+wNLWwCiy6pkKc3ext9WBYMqVb
         c6MDdEVf1Dt4d6YiKmJHaEJFL7ToxDAar3ha2+VROyzfeSnHPGVeQPjx3ip3GV6NCwLw
         rovKyvvB0xS7ePHTh9C9OjiAWa3TrdLyXEroAc+rsoA7wZfsVrninrQriDrvIU+TU5lT
         K3Nw==
X-Forwarded-Encrypted: i=1; AL+hErFyxYIFo90WtMwkXFwA8v5gDPRf0zWSRkv+BuKwuctrSziDV2XWX4tflJkhiA33PC/iGM3W5DiYIouyIjih@vger.kernel.org
X-Gm-Message-State: APuU4Z80HUhl4IWJ9/bvPVHkbir7btnkDxc+IcbGnN8kBL+jbfP6oYrm
	g85y7QCd8Z+akSB2DEb+Ws/uYZ97DcFB6dx4cV5SUzGH9ZtOV4Rs4oYJdNJBlaPSRpqLt1hMj9C
	O0SRGcY809uZsX0itwhWBpVptqdNd4q4NjWGWbR4rQAsfHiaNsz+TE4tj5YMmEaOs6HJPB933vp
	CV
X-Gm-Gg: AZFdTZdOGQVnDjSuxPUD8RHyr3KcsCyQ7n07bSYlis1XatQzXUnv7eDN/W669eN5NaE
	UkdwdJ9/MNdbDbbiG/1gaAGsJDLhe7i4YASVd+a7IuJ+cldGDA8SGvsDJocGRLUohoMh6LkuYIS
	g9pPt1uMC2lNwAXJYzGfzJW4Ls1wk0ywNA3DNSu7yskklv7pnOqN90sae9B/tD+TI7qpUiqoDip
	tAQTYNZGkMIg8iv5ZFOTRC9y0rDEEIx/Dztwyqj61E9ejak9eU/Aq9SHx8KkuenCvyDKpm+5Z8B
	MRljRsUxc5Kro5QQhDwNg/ED3KDow/qSK54eeSMpBhttWEm9JdzOlZG0sdo3xU8eRizEFacs72u
	WX0GLfYotz0qtFnfEt4Q2qdT4uOdJzjGy2Pf57yhRbUO89vqhsZY79HrBKB80vTto5qz3KZtQsp
	mF64c=
X-Received: by 2002:a17:90b:3f8e:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3b1b0b5f193mr11585571a91.66.1794896724059;
        Mon, 16 Nov 2026 22:25:24 -0800 (PST)
X-Received: by 2002:a17:90b:3f8e:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3b1b0b5f193mr11585546a91.66.1794896723403;
        Mon, 16 Nov 2026 22:25:23 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abebf1aesm2512101a91.16.2026.11.16.22.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:25:22 -0800 (PST)
Message-ID: <2a4f99e9-4b51-42c5-9852-8747bf8f1a14@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:55:17 +0530
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
Subject: Re: [PATCH v2 2/2] ufs: ufs-qcom: Enable ICE before enabling crypto
 support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
References: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
 <20261112-qcom_ice_pm_enable-v2-2-177e454d6f22@oss.qualcomm.com>
 <20261113040820.GE1742@sol>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261113040820.GE1742@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8kBi+0T1ni/w
 S1VTnHFsAr0hg8utjNf3sC7F3OlcCujeUVd6ZlLUy6LpQzKLf1+L6xGB/svOla+8r3vNBF9xNfj
 NPjWXFZiCjjPRMl46mkRcrKXHUSDTtXN11TsGLxDi+WOEbNde1uuTdSnBeX+/pcvTpWPbIKcVp9
 7Gqyrk0xRY+rJulzq9mX+TNEaXWIIusx0vwgOgV4NicZkVHjSmOBEsN+CZRzYIy/WvO5jkHrkNx
 vdiKxZA3KeHQ20++q4tZ+H19QFJohX2Zk/Cd4Y8q5U/apfC6CnaoI/xnPxMlTQchezjVsSA4kVw
 ksg3aUjwICbIRrM+nIE0RuNgVLLNWD7s3ZURC1j5OYluYa0nLv0/kS62vnQHzp72JZQ1vcBUqJ9
 jk7gY1FPDe20wcY+QoQpPmydNdIbZDCc1B+s2BSda9GfhvAIs/S0YsqfrDWquXnQ5JKORru9d0Z
 7juk+2h4cdBiUVTSbLA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afbf355 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x_L3ctan3gn5YDiFMPYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0B-nS1Uu5tyQwiNGvEy5RQvnQ893URnK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX9Ils57GSbfgY
 kSbOdJUebULdwXeT4tWC5Dis7TEWPzCKazDWHWoKpBqHBaSQ6BCxDpoYJ61zOQXGz2zNuq1//+u
 e47A2rI29Iw+sPdz77r8tBgBICRXc4k=
X-Proofpoint-GUID: 0B-nS1Uu5tyQwiNGvEy5RQvnQ893URnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

On 13-11-2026 09:38, Eric Biggers wrote:
> On Thu, Nov 12, 2026 at 06:48:18PM +0530, Kuldeep Singh wrote:
>> ufs-qcom currently exposes UFS crypto profile and sets UFSHCD_CAP_CRYPTO
>> before enabling ICE. This leaves a window where blk-crypto can issue
>> keyslot programming calls before ufs-qcom has explicitly enabled ICE.
> 
> Please be more specific about what actually goes wrong, and why.  During
> probe, the crypto profile hasn't actually been registered with the block
> layer yet.  So the above seems inaccurate.  Likewise in the MMC patch.

Seems i explained problem in cover letter and didn't mention here.
Please refer here:
https://lore.kernel.org/linux-arm-msm/20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com/

Actual bug got reported in storage drivers after introducing runtime PM
in ice.

In UFS probe, setting UFSHCD_CAP_CRYPTO enables the crypto profile and
let blk-crypto layer send key programming calls(i.e
qcom_ice_program_key() in ice.c) even before UFS get ice handle (i.e
qcom_ice_enable).

OTOH, with no runtime PM in ice, clocks are remain voted after probe
too. When key program call comes from blk-crypto(qcom_ice_program_key),
it calls qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot)); and
works fine as it's clocked register access.

With runtime PM in ice, clocks are voted off after probe and now same
sequence(ufs-probe -> key program call -> qcom_ice_enable) introduces
kernel panic as it's *unclocked* register access in ICE. That's why it's
important to enable ice instance in UFS before blk-crypto trigger any
key program call and hence moved qcom_ice_enable in probe.

Same sequence applies to MMC.

Though the issue reported once runtime PM in ICE got enabled, it's
actually persistent always and ideally UFS should not assume ice clock
cycle and get the instance early.

> 
>>  static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
>>  {
>> @@ -188,6 +190,12 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
>>  
>>  	host->ice = ice;
>>  
>> +	err = qcom_ice_enable(host->ice);
> 
> Use the 'ice' local variable.

Ack.

> 
>> @@ -636,12 +645,15 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>>  		 * is initialized.
>>  		 */
>>  		err = ufs_qcom_enable_lane_clks(host);
>> +		if (err)
>> +			return err;
>> +
>> +		err = ufs_qcom_ice_enable(host);
>>  		break;
>>  	case POST_CHANGE:
>>  		/* check if UFS PHY moved from DISABLED to HIBERN8 */
>>  		err = ufs_qcom_check_hibern8(hba);
>>  		ufs_qcom_enable_hw_clk_gating(hba);
>> -		ufs_qcom_ice_enable(host);
>>  		ufs_qcom_config_ice_allocator(host);
>>  		break;
> 
> Needs an explanation for why ufs_qcom_config_ice_allocator() and
> ufs_qcom_ice_enable() need to be called at different times.
I didn't get any issue if we enable ice in POST_CHANGE, I added as good
to have change so as to make ice available at earliest.
As no issue observed, I am planning to drop the change.

-- 
Regards
Kuldeep

