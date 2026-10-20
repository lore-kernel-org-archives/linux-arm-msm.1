Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486390;
	b=adSNu38OdZUWaRt6Nkoy+tKUtqkqjID+H2E5HerPugwWXh20+ObDqieJrvyRTu6GfYXh
	 hKt9xnwpgW7rejG3YGcYItkGsTgvayLHIInFriUB798kxqE33PbmfzLVFRD6WJdR1fM73
	 rZ+M3dX2qF5NPSPUNZuNg8sI6duicSz14kdteCo/kxe5nNwMldehCTtHzoNVos1vYQYai
	 DnOznVnpeZDU+7eb8+0G5UeNYRgfnGUXQHLQFy75EgBNhjw3pnB94cCx+Azmr4R97cfU3
	 hR5K5RKdy7ZjAPPB/it0IB0QwcXxTTkTQc/5Ee+5O/R0vn+SkJDst1MQeNNpcogbLUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=;
	b=mtQFObwi3znKluvxOWi6Cy/8PGnlTfuCCJZabTkJh5Cvv5X6oBWcKFyEc/cyKjL/KUhO
	 5O20CFBiIF5R5QEREMCQpadFQeI8TMbqNaOBRa8aL/NXdPb1Z+kzaoz5nl8UQDUEWr1Gz
	 B5W2OaczsB8U3zmAnO6N+1Y43TPXfe6k12nBbHBBm7auaztG7XtCa6QOU382xdYpG2N7T
	 w2x9fN8jPN7tMvOChyK1ruDW7R5GvIDQE5dewjpFyMwfdgwO4NrEqHupsHR4djj5Z1gzX
	 HfG45Zn2XEzMgCRVw8lZke1hCnSb/gXatFJo9HdKJ3YvtnXZud4vdJlS7QP/bMd11lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MKuSlqOr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P922Vvum;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F6606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MKuSlqOr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P922Vvum
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8QrRr1254226
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WlvSUhy9NQS9KPGPiYSnQtbj
	1YWbn4EqiF+2amxYei8=; b=MKuSlqOr1MM+K2c3lV9aBkreZDdS+7X4gg6fZ7xQ
	A3gWp1J04TcSKHo+Cqivfr9CyaNl/XGsYxZtmGs74g/OSbe2DmeTqV6mDHWMrV1h
	6rHKhKDpWzlJ5VTfc862Lf72+YY/0DRjkyx7KsgCUPOu3gyNk1UBxe9dX53rHZRS
	z9YYngdReEEG0BInhvyP0dFVSToeL056kSdQ7EGcd2gb3jP2hkDqcvnudKi+LJ0i
	OyC/Sd8oXiNVqohNxM86OyNWZ9mhzbyQN8+U192dhoXlAoByYewQ7FQ7NQIPNTge
	UtrOthe5bkp+PLTtilB1lsM7q7qr1Hd5qkg+3Dp9mYVuFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9pq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:53:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso9262537eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486389; x=1793091189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=;
        b=P922VvumJwicJMfFuVDWXVRBuPd1awZU1nNxkRiirWl/nVT6EFkYhq14hWBX4E8sUv
         uUyoDSH0wCnPjcE/bD2tEFcz/QmLO/H+LNo3tQALcGzMVjD2uVF+3y5vVH2dP2gzqHdH
         jmi9tJ+4Vk0ojixQccva2x+fytCcKGYfCwLAfri9uOw0UaZfRfEC4K1N23jZ8LbGiKiD
         nDndCgfMV54gbdII3K3Yad4dJwKgydFZsldmOOQfLh6Yy99MFtAgSQct4/6D3yq7IL3Z
         7tPV12GxOpTzGTqK3T3xYlURj0TjNNZh8stHoMOw/UVfvlluHawt0+Vr24Nwm5kinu+9
         bt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486389; x=1793091189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlvSUhy9NQS9KPGPiYSnQtbj1YWbn4EqiF+2amxYei8=;
        b=zDAiLEXwbca3iWsoWJoa4YUq1xT4FLjXcYMkraKup34iWdZGHo0ozDRQSzPED8eNQt
         5H0uqL3iKTrDfrhn5XPqW7FNtIySj7tYyzEqWZ5ZyG5c+THtpFGsGrLhSV5VN4E2t2WJ
         boSNmQvDdxZ/4B0upukPdTLtrSORJPJJ6qhKHxzcylngf3TYRJoKESF2Hvl5Da8k2kK1
         QO7Fuy1TejT+9t2DuzjWwb4e3/OJccjeKg7z1Rd6XvwVTc/gRQ+oXMW17HNKC5/p9k/r
         WNkSbh47PO59wAv7pIxLBsu0UCC56vRxqN+GXrs2SRZPcBnfKRW6Jt4exxh7Y8RCeovY
         I5nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqAugb8dDEpBmnjB/ctPq9ecuVezzkyakKr6pLd28928iPC4spVEAuhZIFCLdj3FZ0gibRZsH4L/fnFsD0@vger.kernel.org
X-Gm-Message-State: AFq9FYK3snobgJXW/NeXthhdMy2UiPE/TJAuiEWPdNyDrGab3d5/qc/y
	OoddtUsvXOZYyW+bdaWo+XjiARnMY8v0TUfvQGQgBFYWX73lQrliFn4KFjWC5XEReHei3+XIXCY
	gCeuBmiBJHX7PTo3E3HnxiwL9Vk2juX+OkdmqEIryzNvRiUEQTqU0d86INs43wmSH7ItTOsLhSK
	upcs4=
X-Gm-Gg: AYBFou18wMuzh1g14NctE82/cZdWz0LY53xOhFh0ZSp3FoRzeRepOY0MQGU6WIAaZQe
	WYOAIrnw22bhQUP2bWts+acFXgu4G0TbeGmcgYh+ZG1OGfGt9nSzW/Ra9EuQwJOm5gSZBAlgzVg
	GJfxa5l2T4/zAiLku51m2ZuBYAp9Xgpwgg7tpWfbZuLUaU1wnbUrYt2weM7sJLe/UpJKtMtxjRr
	BoVyHbiz1QgqUcfLTX4Aqb8NZ+hqcKXAiHI1otCMI1MuWNpMSurGrMZqFTN9f30AmA0yxwuWxz3
	JLDcO32bZdXkKYq9wmkY540tE+iq8Uwp/zEEBN+WOFbt5B9qtbB1zXRJrFtkgXKJRNg6ve4JzLs
	5GAebb2KQwiYqTD9WrXGLOL5RgxYoPr5KGtp6sv+/GA==
X-Received: by 2002:a05:693c:6081:b0:35c:4800:4da with SMTP id 5a478bee46e88-361a2c36c2bmr15915709eec.41.1792486388784;
        Tue, 20 Oct 2026 01:53:08 -0700 (PDT)
X-Received: by 2002:a05:693c:6081:b0:35c:4800:4da with SMTP id 5a478bee46e88-361a2c36c2bmr15915675eec.41.1792486388216;
        Tue, 20 Oct 2026 01:53:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm44011807eec.27.2026.10.20.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:53:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:53:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
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
In-Reply-To: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: csJA6yDhTx_PJ_GIR60isc-rwKK-XcTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX1P+qgm3m4i5s
 CVSDh8SPdigKxNmEIhIPMSG60HvxdW2S82wJSQkcAM5ruvZyJ2Cm9Yw9HpbvD3vfZUHSYRjk8ha
 WnxPvPwK/jV8jkWqJxfK2B0bRQj/FV61uvJdUW+fQM+CC0Ng3pnAuleK3J91vBCV2wNyLdOOU1d
 ZdOTpwlEvo5giJQgXTJXwU0v5aDv3Xwo7Cn8ho3OzVYRH/PEaAVlV/qqDReVKx4NJS3hYztdGKu
 NRXJVEyoXO/gv/IoL9g9I7cOf8Yo2O1v1pSoA3qCXbVpQN6QqyLrEDbzi/bVX11CsUeQVoH6MYm
 oTVFw70YKuoLWRHaG2kfXTcvSgnuTxf5QV3ysTVwWYTCZl7I4JLVM9eS3iLObkBi6FF/rcZdz5n
 oexz/R1boXevvRMfYdXHGAQ0Spe5IYKPIn3xpLXu1XZSclcM+YVnIbjJm5eZTpevntl3qtfJ6a+
 HTp04xclcYfWDKfGnNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX1p06l5BgBI61
 owjmFL1rJdGTVKBkTNMAqiuAPHJJ+AtGLsQMr5SpcHsKC8fuUDLC41g4nLf393S2EfRlfQyGLMp
 BiijeCzv6SP2VFyF9uCGnvffRyovZlE=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72bf5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2JoaeQ_52KTGIJA8Ts4A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: csJA6yDhTx_PJ_GIR60isc-rwKK-XcTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

+ linux-arm-msm

On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> For WCN7850, MAC buffer ring size is updated to 2048 in
> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> to increase peak throughput.
> 
> But during the RX process, a phenomenon can still be observed where
> the throughput drops by about 30% from its peak value and then recovers,
> and this behavior repeats during RX.
> 
> After increasing MAC buffer ring size to 4096, the data rate drop has
> gone.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

FYI, in case someone else runs into this: with this change (merged in
v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
working with the older firmware that Debian trixie still ships
(firmware-atheros 20250410-2):

  WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Probe and firmware download succeed, but every WMI command times out
once the interface is brought up:

  ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
  ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
  ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11

Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
reverting it on v7.3 brings WiFi back with the old firmware.

Unmodified v7.3 works fine after updating to the current linux-firmware
image:

  WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

On Debian trixie that one is available from trixie-backports
(firmware-atheros 20260916-1~bpo13+1).

So nothing needs fixing on the driver side. I'm just leaving this here
so that anyone who sees "wmi command ... timeout" on WCN7850 after a
kernel upgrade knows to update the firmware first.

Thanks,
Shawn

> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..6596089d4168 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -205,7 +205,7 @@ struct ath12k_pdev_dp {
>  #define DP_REO_CMD_RING_SIZE		256
>  #define DP_REO_STATUS_RING_SIZE		2048
>  #define DP_RXDMA_BUF_RING_SIZE		4096
> -#define DP_RX_MAC_BUF_RING_SIZE		2048
> +#define DP_RX_MAC_BUF_RING_SIZE		4096
>  #define DP_RXDMA_REFILL_RING_SIZE	2048
>  #define DP_RXDMA_ERR_DST_RING_SIZE	1024
>  #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
> -- 
> base-commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27
