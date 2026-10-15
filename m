Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA651E422
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068253; cv=none; b=uihBF0bzl6zp1y86KmTVqpcxjaWsafV2SUk7MqUI3wlzE/zUtNdntKmB9++Y1K6gHxpPs7Xug8+gLJn5mFSpLUPClTHDlZ3PSVmPhm1U6UrFSK7FZ8KrrTyezu60OWSdeP4xJX2NmFcNpFtxqbFzDiAa23/Yc9y08J3T0Ewf+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068253; c=relaxed/simple;
	bh=bBuC9lBWTxWLQj5mIQ9SBsHUy30hiWCjMGzrgom7hTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHQIYkm5IXeZVwzSmwV3xXEUM7uDxvWjjDZK2dL//GcBkCNi/WQ9YQGiL322NOgpV+ohiNm2u3BxiyFVowcDLbQDSvN/cR64Q3j2cU1N8bQD5B3U5QWmDGDsUdDIsNKgDU711Y/k5gXQk05ltGa2N554NGUH5qByLXaXi6qInFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXErPWdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3CtDtv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXErPWdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3CtDtv8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jasg2966471
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AcenQf0MRD3oz1H9g3GahMZq
	2f6yOhJZTQ1+IPDT8hA=; b=nXErPWdVKZP+8I/3d/VaDe2bbfFjvwZEWb909h4I
	FyDmSepoK4YiJhfDKBHvDNWf5fqde9OFdsHr7Kp1opgPx5iBBLip8AEXuDihSWIE
	RWLVUso/Ts+WgJs2wAI3y6D79+WdlputflaaNIap/9peWSbv4MxvVcgzaHtsQ42B
	N+LA1eadtfd675RTDEOcCWIqR9Q+rjNRzxN7MJQvYfdOI+YzCX7MyVOFih6MqxQJ
	tcp8kuO1Usg+t/+XBm7qIKyJbz1UfZziGzfMPX5EPFWJQlSzKhLsm9+auewR3yJM
	JGmgasaXV7ilmF1UvyBumv9gnPFhYUZPSwIojDdVGP4XEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wv2hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:44:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a109c937so19328036d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068250; x=1792673050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AcenQf0MRD3oz1H9g3GahMZq2f6yOhJZTQ1+IPDT8hA=;
        b=C3CtDtv8CC4DQG5VqSBvtIcEuWl+KCmQpQ4N/TosAF1zwXg88jcCw9E89jvl8O8z37
         jMP1yaGX+Wk+7Em+rsMobVsr11e/HT/CS4D+qDc3o6lDYWIDAWug42Jqmr7Qq5/xs/hO
         RGlmPn2yUbMaNSnLXrce44BF5b7RxuaeHl4+Chm0i6OCN8yB2McYN9tEQKunjMsnMb90
         WOqBiDh541UPgIq9AxIbMISp/DMfY8b0PJiBq6gt+wbaGmgepfbZHy+f1d+oqLZ6Tz+h
         fT4/O/gotRQlS1IHLlaK5m291178lzx4h8ol5svRj06GiEKyjw2Q62HzXwnokaK5U46T
         JlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068250; x=1792673050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcenQf0MRD3oz1H9g3GahMZq2f6yOhJZTQ1+IPDT8hA=;
        b=NfQQdNzhkrQCK8Ff5oLE9+Bj1hYRVJhe8YI3eYf2L8ceWs3cLh01H6gt/0G2yufona
         4cMfb8DXOdkUx9cwYdD0FBFCpyysyvbSxAETEbpB+bWiDIdv0T+p2t2XAuxFJZ9RydZa
         0FIdDm4Ek65iD9Yp77n2AyW+9D940P6QNDmKLRZyS/9dThpLzFhPV3b5HZ5IWdt3JJe4
         S9G6twC/mtCXgSeu9UenTXxq2au8muW35dukrPAbYRa25BfP42lhbEXOlL0QGtTGQPj0
         G6q2T5o/7kKUkWs19YhumKSPK+f3/jnPYCZvi8+uIRbL/SLWWU/dlbKZ/r/GyGZfaNko
         8xgw==
X-Forwarded-Encrypted: i=1; AKwUvBzE7j2C9u5RCtr8mc+cDnI1PO6LgUE4Ki/j9fFlhFigeVnjC+9WUYIOV1F8a9qqrPchBQkd+gAAMggxaQuq@vger.kernel.org
X-Gm-Message-State: AFq9FYKojz9wuF6E/kDei7kYCQiKTmw7i1b0r2ckJl/sHkmWqG7w4KDt
	fne3lySF0VqISXTcB0JlscFPOwROFmznvrUYR0eEznw/XYVpxxgZ9QbGhe2Zvak7X7pY9/b9Tbs
	Sg6e0O/nNaMiqRTpapyaKqDXy/nZgFhCxJ8vmpmF2cgIpBOLS/wL3f0noDBXgSW1IrShS
X-Gm-Gg: AYBFou3t2lLpKWLzTIci58MmGYauKdQqJSEBLdPpDKr6C5XVLgpOVysWbGGM0mETV+J
	AJhqIWGGFp1vyegvJC5/8oR9CDq9V5d4Dhp7sJukfhBrBhAMkho9f3VGKXvhM1UOYpKGx4s2yp3
	gzgsWeywCdn8MtrsBpGxFB9iBt4a1aX79ZFJ8uuK4qWJnzAmVLWrAg+FYRf7bBJmd5dcgwsIDqO
	K8aneeb3pnq4Hs8m2vd4Z6iPnlVGpieKh5lbr2/Lard4CgSrqZitb3CKxCIltCy2+jNAUAhxuNq
	gDkwNsLVLlQ4sZGe2m32yuUKnCZ7Yl6UGjMtSekMw8HlOolc0h/1cFWaoWHDB+i0AOWeh0LGJGN
	3atARvOSF5FM8bQR6
X-Received: by 2002:a05:620a:17a9:b0:93e:7dfa:262c with SMTP id af79cd13be357-93ebd2499d5mr2972957785a.35.1792068249716;
        Thu, 15 Oct 2026 05:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:7dfa:262c with SMTP id af79cd13be357-93ebd2499d5mr2972951985a.35.1792068248959;
        Thu, 15 Oct 2026 05:44:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd7319c6sm79853555e9.0.2026.10.15.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:44:08 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:44:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kenneth Kabogo <kennethkabogo2@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in
 segment name
Message-ID: <wcucyqrdhidmebrhwzzsxjzy6uli62ey7caueu2i6rorzsgetm@qulu5w4uagp3>
References: <20260912065651.59968-1-kennethkabogo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912065651.59968-1-kennethkabogo2@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX8ri1niDFB380
 tADfmOpXMDVknmUj54NIkvr+npmwhW5bIqCdcPFi3i94UZVT56t+zYJWhNIO3AyswEZ8fGyrmzL
 RjJeQXV9dY+onhbDTW/Hs+L5426EGNs=
X-Proofpoint-ORIG-GUID: YFF7E_1bpz0pzS4yFOKALuwrOtrsFfas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX/0+QVRN2M5ID
 QPVDaHhEm/vM/vTmWkxRQUW1ikv68/dHGRPxRBsOkJscbFS1bIpb8VGWnJxazyiztNahNo+YbCA
 vWUbTBkOcEohYmcv9QbhhCmo+bHLcOWF8RCH3wbdgdP2/Y9IEpn52Eurd4ZTQMgD/dK753+k+3t
 x0Os/X98YoKgh8fF5cecjyNYSxf/XHLq8ZdaR5/K5ruRPCkE7RGAp8ljBVW+LnzbWaUw6TvKhwd
 FhCp870JedtyK0jvmVPBHSNI6EKxI6rallTMxjo+LpqtUu+cRyTLUtnhU2buaCfc6lfRxV/Fs/1
 n1Fa2ZPrPbjGEpo8WpasOAPOKIBiOJCrv3UhOdaGGYHh1LLnV6LTX9lrzPP5ihmUkeVWd86FhAJ
 12R+kW9zpSRlseRdSY/I9aPspQmuVZO1NpxNIR6ZQkNs2X2Dkf1Myw6us4C7kf8Bq4QUNOCrwAX
 KMwwa17wr3EKWeLnm5g==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0ca9a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GfdbEUfwneyheCU63SoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: YFF7E_1bpz0pzS4yFOKALuwrOtrsFfas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

On 26-09-12 09:56:51, Kenneth Kabogo wrote:
> mdt_load_split_segment() builds a segment firmware filename by
> overwriting the last three characters of a kstrdup'd copy of fw_name
> with "b%02d" formatted from segment. %02d is a minimum field width,
> not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
> which fits the buffer, but for segment >= 100 it writes "b100" or
> wider, one or more bytes past the end of the kstrdup allocation.
> 
> segment is not bounded to [0, 99] anywhere before this point. It is a
> raw index into the firmware's ELF program header table, ultimately
> bounded only by e_phnum, a 16-bit ELF field (max 65535). The existing
> check in mdt_header_valid() only verifies that the program header
> table fits inside the firmware file, not that e_phnum itself is sane,
> so a small firmware file can supply e_phnum > 100 and reach this path
> with segment >= 100 from either qcom_mdt_read_metadata() (the hash
> segment scan) or the main loadable-segment loop in
> qcom_mdt_load_no_init(), whenever the image uses the split-firmware
> convention.
> 
> segment was never valid past 99 under this driver's own "bNN" naming
> scheme, so reject it outright instead of widening the buffer.
> 
> Found by code inspection while auditing the Qualcomm PIL/PAS
> firmware-authentication flow. No reproducer beyond code inspection is
> available; I don't have affected hardware to trigger it on.
> 
> Signed-off-by: Kenneth Kabogo <kennethkabogo2@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
