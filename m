Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAE9427FB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976982; cv=none; b=evYCXnVXAe6FJ7XYNtThWiCxRGL2pinMXp4Q/CVrW4iXSOZFvorrRrvxlM+pcB7do0sLPdRGsECKIUsRs0A48VMIENb8A0cNgukGaB0NLe+RJP5SPLpMPKTFh91OrCAK1CPIFf3lypA/r40axlioYOxGnZWEUAU+GmybibhuSAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976982; c=relaxed/simple;
	bh=qHUVrYNXOCjreop3OQtmlFvJB4z/ZeTtVIsnKD4pC7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fn8flB+7TjNU01zf7HElr2EdMGK3b+K7cYqbqgQyEnpDn5p9qMt4/1VIBOf2B5DGdRH2FiceDM+yggWuY3Ehi1XShakQ6W+U4og/c9/st6HYfquorV75GtMiST0sHFMghXJFUXtQhHRKG85MyncgDIyriW4PLcr8TKbXJ3Aih6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWX4MAsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICbcDQ48; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWX4MAsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICbcDQ48"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5xXP2008525
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXSh2qARHtU3Y2heqKTk7VlbeCt785lyS28ARpXeBMw=; b=jWX4MAsI2vUT9hBz
	dO5KUnKJN3M00jdD52X7WgmdhwD1AXJh/4Fc7GXbsb4TWD7F/xOKmMfTbMjzY3Jj
	sopUSadpfEGmDZE94xQi0J/nbHkfkkPB7uiXyNwXgIcy34Se5I8B6sgsmS1qD0rb
	aaBXTb9kHMx6dIdfpafUI+8WMURGAgiKlY6pJkn5ruWFcezVcQzTYw99wXC50DVZ
	TFe7rFugycGAuH63q15nT7iqkFUSaBAweVRs7w25YuUubEEaiKmSLssNa1eznCM2
	UkB4ehSbq/U757Jf0j0LBQ2c4L7iNfDRe1oFRku59SrAs2AcgbIHIIVlCATspwXG
	nuAfYw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8hbbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:29:39 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c4468f7aso1439977b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976979; x=1787581779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXSh2qARHtU3Y2heqKTk7VlbeCt785lyS28ARpXeBMw=;
        b=ICbcDQ48FAXh6rjZp6r/ef5jc2f375v0Uq+5CI+W4DXgLTWVUVyVzN80ewWqUVUDPM
         t5sRcusRH+DFIToBRR7SfU3Z9Si40N3rpMwm6NR8ygVVGIN7xzEk9GMX4nnEMgOCzR4G
         CSnzrmOVS36HsVZ8+NfOBQwjJZZ2B55xrgIyYiDlHYEtb7DGuv51Zm5GlqByl5EWKRXN
         KQOcxPkCanAB0Wd1H+99q598iHWCBQdbxjm5VGaEaTNMCsvj/t5nwBBZk1MKZIJMEmmS
         qeseNymjxslozqdK5yo0JrKC+VESHzTi7oVp1Bq+lY6ZKpndUNHwUFOGbsHLM43lLDyb
         EOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976979; x=1787581779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXSh2qARHtU3Y2heqKTk7VlbeCt785lyS28ARpXeBMw=;
        b=UNcd7gJ3UZ5x+ttcmicpqL3PHFu0cN9SvfPvSdreuR9fwIxH/IAPOM5UgjG6tvQzZw
         0HP/rW/tIF9jJpMYU3z9G/LV1chyYT/zAuiiBgMOslIZ47at6K7F2DRygngToQ7yScj5
         txivpSUVYMEwEbUdF0jHgiYRA4Zo8ZnORtNE0KdqlSeFW745+Wwo1Mp0BShpCNESJsRY
         fZjIbmDtxV6gDD+Cy4m7A4xvAqdRkUSCCc41TV6cW3k5qZyVwq09bZeJ2j3EYpLfrBu0
         WOerIWvEsLPqETALFfQ1YHV9sbqy8fwG8zzh+xdmrLmQ9/oWIrbKoNimaEysso85mIj7
         mk9A==
X-Gm-Message-State: AOJu0YyY+W5vU4miza9URZjZZ8ybJxyNrs/P20q8vjDX/OPQgtPJmoZ/
	Vs6SYBmhTrtx39g14cuBziuH4EvGFIHyLL4YA7Zpa5rZrLt0O0c0B21YeanPLs7kX4AILMLXwpx
	03tcpgUTGtaNSPVCOmnMbEYbiXVIitByMqMHo53T16IUrC0EIZ6RmM12TAb1iobMHfu3r
X-Gm-Gg: AR+sD12TLZKldL6ILhqVRommnwG2F8yEmJEC8I8dHsjJMrqDrlaR4MdxQ7SrBrE+PXP
	MwIPR1RJXJ4OHH+prZjN3BtR5NlJ2PfrSpON0+CcYr7mCzhooQQsjGK2YVYGG/0aveB/qrEyweP
	waBfz3QGbWQFYcgUFgp8HUVejHuxmXF4s81RaN0d+emxrIOU2dC6hbDk0T9koeSvStTRdyRL4Sx
	ZB+WoFImW6Nn2bHj7hE0vt9OSiDCvSLQrBWi72pJukO9z8s6xOxb+rbbSkrOzmPMP2UoIUkH891
	vmkat2aYo6Rd25F84TCTYb3z0Eb9vBmmwlT9w7lyJKx2lt8cc9DD9fp75uQp2ArGshn8ZItXiUW
	XZI9YnPSyshmec1RIbT9WWFEz
X-Received: by 2002:a05:690c:6d89:b0:820:100e:1abb with SMTP id 00721157ae682-83713764b12mr100668837b3.4.1786976978843;
        Mon, 17 Aug 2026 07:29:38 -0700 (PDT)
X-Received: by 2002:a05:690c:6d89:b0:820:100e:1abb with SMTP id 00721157ae682-83713764b12mr100668427b3.4.1786976978440;
        Mon, 17 Aug 2026 07:29:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45936c3csm10331366d6.32.2026.08.17.07.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:29:38 -0700 (PDT)
Message-ID: <6e88de1b-3f51-4c72-8bb9-c198b4f032b8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:29:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] power: supply: qcom_smbx: test battery health status
 bits
To: robin@snyders.xyz, Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        stable@vger.kernel.org
References: <20260812-qcom-smbx-fixes-v1-0-eb48246be599@snyders.xyz>
 <20260812-qcom-smbx-fixes-v1-2-eb48246be599@snyders.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-qcom-smbx-fixes-v1-2-eb48246be599@snyders.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WbsyCPa_NQuH5D57K3Y9xbNJCNF6I9gT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX9cnOE30jM6Yo
 xVb8mAv/Rl5iPMDReK1VsljAVBZSXNTwxEIP3bcv+py0ucKFpYEeb59XKDSOKltKo5KKs/xZQj8
 DJonGUoBieyPtvbAtcvTZtu1DghwNfs=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a831ad3 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OsHF4jKAAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4rSUyN2hDD0KhXNsd_QA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=aAwnOj5LE8VeXseigifb:22
X-Proofpoint-ORIG-GUID: WbsyCPa_NQuH5D57K3Y9xbNJCNF6I9gT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX3u+pCj3rwF7h
 DwUxVGWiYlg6g9vj5Ss7sRMzkWeXwmIBkzsHr+fiDPXsMtGJM+B7RwQanqtEWlv+2MltDe3lgSm
 xxMg2j/4PxonN1FOjokDMDWNTo/4+2skq3ovbT9IcgLByc9bOL+TPa4BSgPOJhAM/ekiw27yI5M
 XkABuTgVEObTOWNFgNbp3CAniMogr5ScIgxGYW2N3ZT9YeQ9sNsMEwfrbipD9umaZNdsYVrvH8Y
 VxOF/WfAxWBovuAHE7Vbj3FOj8CzN0zJHhdIzrODKAsOPsgUpUnTua1L/vHFArsDt1HOdtPM9Kt
 DMPf7TrZL0W74K2ELLvC9OfU3Q60UxJ5ypT4MGiPbwIm8qO11TShISWqMNgmgxu+/YTU8cfRMN5
 YfMASAljLitDWNT0C8n6BKnrDfRt1QwvqvGjCSKpbaFlwHtLG5fAjLy53rsmrvZgXeEF+uzT6JC
 NtAd3L3GV92aSelLOmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170111

On 8/12/26 1:29 AM, Robin Snyders via B4 Relay wrote:
> From: Robin Snyders <robin@snyders.xyz>
> 
> BATTERY_CHARGER_STATUS_2 contains independent status and fault bits.
> Switching on the complete register only recognizes a fault when it is the
> sole asserted bit, and can report a healthy battery when another status
> bit is set at the same time.
> 
> Test the relevant fault bits in priority order, matching the Qualcomm
> downstream driver handling.
> 
> Fixes: 8648aeb5d7b7 ("power: supply: add Qualcomm PMI8998 SMB2 Charger driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
