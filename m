Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443A407576
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657846; cv=none; b=LBHq+3dWkFA/eDL6pql+RvlZEkol5xdml3G3VAH6OhN+zSMBABSC17CI4beyzmfh76zqF8xD6E2LV+UFINx50gYyPujPy6N8NkkoymJkLgg7KPSZTaxyW24jZWNWUEzqfgbne+ZWFtREdAx4hn/DdeXOimc3Hh87CieiviASMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657846; c=relaxed/simple;
	bh=0n90vA824UpPP0KSP0R7HxSj5B8dzgPKHLVs81WLnm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8nyiQKQFHPd5LNcaX7qAzcaYSByZs7/GqwecsOuFes5zEfSxAhIRG9FCES+uI5ZErFcC0rf6Kzo2H7vwww1oY3uAzeLqQSPkN+tonNnSmcNac74yp3/UNhFa/dxlTQCwlm5n/Y4U09g45JnVbRQFwfgG1guxYJFoPH5EXu4sp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REjBvjIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8001ucx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REjBvjIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8001ucx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPGvY2114803
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asWo7RrLO7QIFKoSVKpSItWS
	Kd38+Y/tFgfYMRtjAJI=; b=REjBvjIggRys4EuYQylu9pINvADvw5L3Btd3gJl5
	mowkIgZFK0rs4zz4rX6yOE37thNO6iVO5Ja6Ooc3nz//921U76cRRa4Eu9e5Ex83
	9FJwx8XnOjjReGD+Bt94wQvRW3WBDZYozEuiNR4IKO9zNxQXjPB7sLxxYNs9eUp1
	W5Ehp1CHKLi9ImJQ+Ju+oRrlc01risX5rsJ0a6poxpO1VYMAzleFEQfDoe9ExIoq
	QeMCb7awAbOdt35c9cKf1covTs4pdOQGOFM0TfOal9XyTeAsXlwO2NLwqz09AdS5
	KMNttUxnEUXL8Fu91xxmjqNesOhU7ZMloWH4jUVxIBU51w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e088f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:17:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso1829950885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657843; x=1785262643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asWo7RrLO7QIFKoSVKpSItWSKd38+Y/tFgfYMRtjAJI=;
        b=c8001ucxowkPoOd9sJDP7csfY9qMZSNKy6S2YDudh46I1HtLjAAph44PTPFlT5AiZ2
         vPhVnU65lxFCv/ajjPSHGGu4waNFZ/H5Gvs8tXFqPK7HzuCFSL7Brvkdqja6gSMnwLCt
         7qqBGGtj8fTjy5uy1wWAe2yy59SDXbRlzq/8J7xzlRA8iL9N3oXy5eYVfQKm/2jJa07Q
         SDG2tlvd9Yo1Xrmfj0lAiTzOochyhV370LOtseSEkSkkLdRn1Pna3tAk8Eq3sf8BB4lO
         AaFgdAtZbAUPGJDmMAO+zCJc0Hauh0f266khVc2J4Sn9WMOduWAm3IvvuMXfYrpNOB7P
         r8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657843; x=1785262643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWo7RrLO7QIFKoSVKpSItWSKd38+Y/tFgfYMRtjAJI=;
        b=j6VNAqzL0VegfRIxQEKxJNcQ9SGIEpDJwWv/u31sk5SSPJqDptJRKkJnlkC0G9d6Ci
         ywyecTSzxpUkhInfmvGoKThmVnnm/pgoAWn/g9i9/pSSxUlYfYPjZ25UctGJeU47cvg1
         JCgYT2OKcHxMyBh1pUzh55S9b8qKDL/3bjUqWH1/wqFdiRNRuofdrQtZlSeKKHEJUfVI
         0iO5K81X4Ke+bnJN6AkyUY0C+RHq3jBJD/MgsUGDjYH3HZEoURMxDyunXQYSNzm8ArOb
         rJajK4uMCCHu+DKUHvjxZwUhtfkJtOb16PVsyVwmZa8PqSvJhaYi8AWyGFLwrPtNJXr4
         sJww==
X-Forwarded-Encrypted: i=1; AHgh+RqwebgqD2sSyNmd+juqyux68c9EOCTnCNOI7re8OrdhkyvEp642PW72zY1RnQ35t6OkdZBakErwcq02qrHl@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKarcC83F+u+GyCGjiwOH7UqvyZtg/anbxNPDHRTRDcp/YNZW
	vWKkfDOssl7XKqkynZHvAFD3tWVQi1vahmO9IIvONjjDjqjzYHzcqioaUtPhfYH07/sXLjs5CE9
	Zd5iyUOpEQhC73YrFrCw2lTUZs2GEYDviIk23FRi59n5FtMmNuwlK9z0hQyrD4y2bf3Nf
X-Gm-Gg: AfdE7claGD/aHUkg3KQrPe5pPkUb4EqQeZC2L7S5Rb51F1RZu2yojePg5jNjSt29aSj
	9HxdsnAO6VvTXPIfDMAx0x83ZkGOUZvbBFnbOjfuXNNEEukK6yB/4ZsDCwxpO07r4cB3MeeWFio
	tn1IMHjU6n33NnufsIPUR2eMYvWNmuvofwzU/QkHVXIbvmRpsjJba1/T4T/rxr6AvRUlyz2PITx
	gOvhfkfNj+Qr2fFg/5kYXxf8fYgjEZiUdMHiLCRh5pflD6BMJOPwIxdRGn74wvYqfwQ1osQi0kR
	N+Mv9Ufs2JyA/Snnlc4H9XhgsccI2hGDEyx1Jt6bUaMqTMPZ/iXHAuzBCJgYYylt9HSxAbUzEOl
	l0X6ryL2UayOigPKOZEu/3VQZYfZx44UV0hl9juyseNyXe+kbPo2eAG7yN2HcWj20EUEw9jeHAX
	h6RRYMyxeR0h3odQ==
X-Received: by 2002:ac8:584c:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-5213d8acfa3mr195147961cf.28.1784657842717;
        Tue, 21 Jul 2026 11:17:22 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-5213d8acfa3mr195147561cf.28.1784657842023;
        Tue, 21 Jul 2026 11:17:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f50f18sm59301e87.82.2026.07.21.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:17:21 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:17:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16
 (UX3607OA)
Message-ID: <gpfggty2ddc7r3uhrpwlazuyr5ep4mfoc6mscpwimhhaztnzq4@y5ftly3u67h2>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
X-Proofpoint-GUID: CVlgWByvnxNKtpkJPh4ox3MGWqk_ze4C
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fb7b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QCcXpYcSlj5nmBkoM0sA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CVlgWByvnxNKtpkJPh4ox3MGWqk_ze4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX3o4U1QLpOZWh
 diDQlJ0ovjvHKZpLySEmduMgTnFDhw0fmtBt0j6cgjjapmpADAqxMwT1zYnqFdJvyKD3KWp0vZX
 KH3KgyJ8p8det+eYHr3Ca1e7CWYSsF+IZD3cdn8GG6m2eCrB2Vj18I7ZWRKK5txJTEzE+yyCf7F
 ha0fCs5fhN4qk0e84aLirtNYL+VxzGkOPUiCx/Cp3udyfjiwOkYBrTV7e2uxpw91TKcVE3Bdms3
 3jvg7txDlLgnv2nkT5fn1ENJpf1B2/K/RFVBFFbQUg6FuIcP5+HecQW39+80MU9BtJk28yzngpB
 ZGKYUV8pInM/YKoGJ8ufuUrOJ1E3qj5EFfUTvizwMOH1K4xnk89PWj9BRDWgQOKNbODJ1nsD6jn
 VtFGwGMNzOn/NuVhgf39l55vOj5aHjTdkecokwFOH7QvFEVak9gdXFYAFjLw/gzaqqOVy/zk2DB
 GY+h8A6Depw/L3pqtxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX94LnA9UnqXK1
 ry5SnpEnaG4vZMIV40ZYOeZRiFBDfK/ei3uXQIJ1TCzyGEtiC2a00/i6pDlayDXppFPvk11mgNA
 t0Tf3N4Qg1sS1gXQiPYDhQZupMd0078=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210192

On Tue, Jul 21, 2026 at 07:11:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> Currently working:
> - Audio playback (4 speakers)
> - GPU, Display
> - HDMI port
> - Keyboard, touchpad, lid switch
> - Privacy LEDs (camera-use, camera-block, mic-mute)
> - Charging, Type-C, Type-A port
> - Onboard SD Card slot (RTS5329)
> - Wi-Fi, Bluetooth (QCC2072)
> - Touchscreen should work on the SKUs that have it, but it remains
>   untested due to lack of access to such a device
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1271 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
>  4 files changed, 1274 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
