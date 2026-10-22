Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660865;
	b=NggvbZ60VgQYcldb+1i8BZDmtaBvxc+xBuj1WCuJJq2gMUbYDAkjYR3fqfKujv+6E/pY
	 JuN3tdrBJ5WGr37aetsZZpzxYrK0UW77xS5FxKCkh7caxiQrB2gTpRmkZTyDs2BNX6aEP
	 E5QQQaAtMSFZJgnXm3IhyUnk7aEtZcyTHdxVYK5vfDLT1BizQ49qC+rGHnxCwsKLprk1P
	 ku8NzXd60tYKwmyY86JSbHLxk5GVcx2h2GSimLsGLmSTmfs0zGyE4LJcdD5qVYgvJJcHa
	 QtQCiqdT47RfEhDILtzbOLgeXFg5Avc6WDOn+r0Wo3FtYLPFDQmhR6z2A8TLSFfht8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=;
	b=JPtyTBT0tlmzpx5EjfmdMbUZP2gClx6Vhpli0CKGgHQkITvO475a+x7gBK6fnAnj2+rg
	 TwP8AUADcmsedt6qB1NRbb+AzbCXcznHozbFFp6bu1GXTdVKAA43e3s9rMkJ3WweCIUPj
	 rrcQcQdJMFtfP6VI/x4KTeucLlk7SxE/u0yQSN5dTDxr5dLwMHkreHqSN9VUzaRPSn8rp
	 mEkKKjz1SpKJv0gMkBSkEzUYVtQ3Y7bQQnf75kI13Vr+JMyPceKDHw44VnkLSnd4vnLwF
	 /dSm2ofBsAfVIfSSMcSuHTL9EXPOkxZMezZktlaQMb6gqoUNnol6/HTBUgmt7neuA8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmqOGSLG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/D3h7yM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE44606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmqOGSLG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/D3h7yM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M709sV2714656
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NVpZTOS39bJD86GMEOLkvTbG
	4Abg3hAHRNogiWaaDMY=; b=LmqOGSLGYOWzGrKYFVtIei8sWtRTw/GT/JAqZbcb
	SjuH/NTEV550ufgxdJ+sanGKyDZvpG3M5CmJ/vxvGNL4REDOY9BVnMraIrJqOk7D
	imS7hFYB1x4b++4/WKhZ6+TRJKLuf1v1fQ03iA6/uL6E6JSHDSyq10mzh3qHMng0
	DCEvz4Tkru+Nm2RTPpYwdjqUVTDgfe7UAexEJh06SzbobnjrXfxM0JErZcxsTmxi
	VpL9HBlKxG3rLgz0XvTHaMKEW4rxcWFWvtvqb3mTDsAUR4IRVtZQFacVtl8MMGR2
	HyHlipI66oUKzsJ6TlqKn27/XYGA0MBeip6Oeivae1xR5A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsn0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:21:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso2625347eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660862; x=1793265662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=;
        b=E/D3h7yM0uHoPUFiK2LZM2scmvqMZTt2Zr0tufWKHFkGX/qspvLCO3sblsieHbL9OL
         usX/sYZiWNTNapOCpgmZAWzija+YQ3p+C/a5jDFdjLVMS/+nk3DiHpmLKEO2/m82n1xI
         6VYqrBwggJJlHxvb5RtyY4Vac/0CK0L5E4N7Ic1IO+udIkamPmpGmyFIScfO2ou8+1ZX
         lD3Vv9Iu7BWqE7xMLg3pbfaT6lUu7VMH4GSkkCCgeifxA58PUODguZYSgQPdNFZvlAq0
         JzUNZYusnk7Bek/dLTz/NBb5lQ8t4U5rIR8IMqu6RX68zNlruFCpsJxoCmVWB3EKa99c
         99mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660862; x=1793265662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=;
        b=a5RhG16Xev9RW+kHv5ZnhVj0C/lnNjtEz59Yk9y2Wy2rqwhi26zLnSLLD5ok8MPgjL
         Ps5+ATggfrT3xGZHCXrwHvPiDNfbHrYjqdGQiqdfJUHcGiAwt6zcrklm8aGSU1HqBiZb
         hINWgJb7i5ck8ZmX35Ue3wJ6TemmCEBzkHmyq6c+qBn9o4vyHS3hDv3+F8BQh/iU4H3C
         puSQzAB+BughfJD/oBHLqhGucO9IHeIs3J0lYOY+8OORuMsXGya1KP1GbiVT73rK0Xux
         V9c+70EEKg8+yFlhPJmXfEPOlvx4qrtFb/poonl95RhHsXT/guI/8viA6RM4Z+V7VSOa
         GYZA==
X-Forwarded-Encrypted: i=1; AKwUvBwndyFgVEjk9hNHRpQObXWKz6yMynk3VZLnzdvyUiGdlwkhsv2sn2/J6EI4r/Hhd/p2WN5rQnOM9bonGaxk@vger.kernel.org
X-Gm-Message-State: AFq9FYJi2OIUe4eiMdJUnpxnmbRwZDnrfHeAvUEWthMXv4I0+ibGFeDq
	M2VlXV9eJsYIvRjcvNSi0via/txp3LwdX4NtqULQEy15IG/I5cOq990FXaS6TpZ05YsaNdGc7k8
	QDBWI9yex+KVxh5MuaTFQA3aIO7ffHvEsrWBRcDQgim41CA3rTTBHLgTd/efoKtb6ywo4
X-Gm-Gg: AYBFou3W522rQAGEoOnQka1uUXImmFt7BaLX+usQIlmfOGFfSGPCTf4IXEOeXA4tVeR
	XfOT/DhSNtBM+WS4PVwNoKIrjwzm4cFQvTM+vn+iQk+adCLoTskntIE5k+UrMzoscLSIOKfPurH
	/AwRqbl5dGJq0lk/X9kaO0lzuZw1IpW/co/vvp7OVXad7zE0p8wyRvd3zrCcQZIfTWpZwKZZsZS
	Jev6idQTmgIH+h3vWN3xYaP/9ig0GIgi54RAe48lc9Ve7g4VxFfpW+XQ71uiEIaLMdIfn67R4rA
	wdZYfkYI+aSsza9BlpeT34IAzyY3NUTdwX/aIS22GK8N5Mc4kLsSt3A9F8709QbXD/kUFVPuGsG
	oDCyMkVGGQa96OK66X6rqlHb9+1hK7+Zh6tDh1ZJvIg==
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr7430756c88.2.1792660862377;
        Thu, 22 Oct 2026 02:21:02 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr7430729c88.2.1792660861822;
        Thu, 22 Oct 2026 02:21:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm19923167c88.5.2026.10.22.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:21:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:20:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
X-Proofpoint-GUID: xUZQo3G9y3BGlO1H5xvePHLkI4Yso24e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX1IEiWgwYPakm
 lUud2gNpEuca6xpu0jWmieJYjyXGexdXYmUcoFFT+hKUmIJDpV8nga46XRsm3sgowP0Ms3Um8Y8
 lVNFObesGiukaAH9eoa7Lu0jbywuGe5pUIhYmrTrdV9xOmUkZu2QbCj5K79Frkd4spDRYCtghWx
 Z3mIOjS7410Qmabl6ftL3AKa69KoyLmGypTv5wJlqwoIcmmMlgISYLCL1cMkae92OmUZ/2L5LeP
 fNCuhEqHNbjuRjCJN2ii0otTYdyIhgjPvNc8eGoYvZd3pF8eN03SqD782U4F75zstoCroFulsoA
 C+otCLnf3i//B87WeKmw+ZLkdnuTE4CwB+WhVSEF75nqX7xtg4v7V97G+txKUminqYVV/ufnri9
 cx/VYPXg+JS4h78Ih1YZWfibEV2z3khcotbcIM2Eg0Gh+i4Iu3THs52/cbOfADTAiVH5+gAIdTZ
 GY5ni1rgbpIfb1e1QIQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d57f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=08gsXnlTphqh1DqfKuoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX+shdS2MrURIY
 vEcnu+vaXHLbkaW6Xaajwr2ACc8wmb+K4K193i0rSDwE6sat+bwmdEcBuKDy2/BHWg5zuDvw8n5
 1Xb0UuygGIlBcpSbo8SNnl8e55g9kss=
X-Proofpoint-ORIG-GUID: xUZQo3G9y3BGlO1H5xvePHLkI4Yso24e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
> 
> 
> On 10/20/2026 4:53 PM, Shawn Guo wrote:
> > + linux-arm-msm
> > 
> > On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> >> For WCN7850, MAC buffer ring size is updated to 2048 in
> >> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> >> to increase peak throughput.
> >>
> >> But during the RX process, a phenomenon can still be observed where
> >> the throughput drops by about 30% from its peak value and then recovers,
> >> and this behavior repeats during RX.
> >>
> >> After increasing MAC buffer ring size to 4096, the data rate drop has
> >> gone.
> >>
> >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> >>
> >> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> > 
> > FYI, in case someone else runs into this: with this change (merged in
> > v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> > working with the older firmware that Debian trixie still ships
> > (firmware-atheros 20250410-2):
> > 
> >   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > 
> > Probe and firmware download succeed, but every WMI command times out
> > once the interface is brought up:
> > 
> >   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
> >   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> >   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
> >   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> > 
> > Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> > reverting it on v7.3 brings WiFi back with the old firmware.
> > 
> > Unmodified v7.3 works fine after updating to the current linux-firmware
> > image:
> > 
> >   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> > 
> > On Debian trixie that one is available from trixie-backports
> > (firmware-atheros 20260916-1~bpo13+1).
> > 
> > So nothing needs fixing on the driver side. I'm just leaving this here
> > so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> > kernel upgrade knows to update the firmware first.
> 
> Hi Shawn, thanks for reporting this. I just had a quick test
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
> any ath12k warning.
> 
> The firmware images I am using comes from the first commit adding WCN7850 firmware:
> 
> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
> 
> and the md5 values are:
> 
> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
> c79c410d585360000c0490f16fda43e2  ./board-2.bin
> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
> 
> can you share the md5 values of your images?

Hi Baochen,

Here are md5 values of the old firmware shipped by trixie firmware-atheros
20250410-2.

$ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin

> and have you ever tried the upstream mainline
> kernel or the latest ath.git tree?

I'm not sure what you mean by upstream mainline kernel, but v7.3 should
be the mainline kernel released a few days ago.

On the other hand, I just tested ath.git tree at tag ath-202610191908,
and it worked with the old firmware. So it seems there are some gaps
between v7.3 and ath kernel.

Shawn
