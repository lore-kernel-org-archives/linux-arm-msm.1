Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613553;
	b=CONmXv28UPAc7Zh5STNAK6M14tz4nUPKasqRuSNy5w3BSJaTuT0477EfpL1Ew8APmGe6
	 L6Q9ba2/+sW3aHnCBy/ZTdw5qzOeVTFAabZOVOmco10KicMPI7jfj0H7GmLHbfknEyN5E
	 D9ctuZCJUr53cePTg07OBcmN9vMZpNqBSFyrcLDqmbFa8vLQ9n50mxDLIO8GJUQOubcaZ
	 104FxcdL9Ivu9MB44L7nV+G0U+n0u/R0J3opHR+2IMtsYkxJvmL0KPYNb0udIxskaG8N0
	 xy+nt6M/AWU82jlmIiSU+tO4He1mcaNGG+TD9JuoZ/YNfECOKfnX303jgt4CExGuVXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
	b=r4Xmpl1QDlxoDwaNl3jq5bgThIM510sO02oW5iK07SUeKtQtut+y4DasfKFR9NM/o3hc
	 nOeaTe8z2L4d7AS/rxx0C3249tbQQ+rQYl1vb+8QQpCODlvzSQaBzZz6AqWwCDuXbKftg
	 Mb5LG2eutgBhO7+9wPWzuoyzVa6cI2/wn11tKXFlFMMJW7zv2SJAbjEowc2+dZ0anCY9D
	 Q5YR35uOLG5blW66l9lyH408iNvl4xq8FkrrgpOu34XDu6NZUJOWQHpnAp3e2ym9f3M3A
	 NKtuc517ODBkOADXAJFOgB8zy15/tw3qTPpQnfc5buMciY6Dd73BA0h70tOp19IPOiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctdHG2pg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHzd1pG2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81258606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81258606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctdHG2pg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHzd1pG2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A65R2466622
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DvLqP/tFCRw+lDS6WYFmF22W
	IsggD1RJMNZO7NQX0Jc=; b=ctdHG2pgkaQCYWdXQm7JOTj2bSHBkT/Kdf70Gzfw
	vfeGb1ztNVIX+f+hBwpNXGc732fuW673AIMV72by+Z1LoNgJgIx1M3ZdiIbGv+zQ
	9y19vQJ+VpPpsw4/14hqmAMg1vyr6kcg1JarJZWCUVn6e3qUAcg027GTqosZ6889
	d1ew500EPfPPzuqftIbOjo770OdBMtD3Ql/r76k09+LlI7MReICFflm++aLQXPDp
	BUN/ksGQb3w0oVzm0BdunQF3DZzA5KHiL2WBqvtCllJ7xAGQ2h6qoBmjVjj5r/ks
	JWgJ1HV5HM0NyP8jKo53WpIKgv0xKcIMyc8SF3VObcBuaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh7m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:59:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so513312885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613552; x=1794218352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
        b=kHzd1pG2eqtms50mvSIRtxABHbW6bbKsrPDc2Mbx5dlY/5dZNRjnn9p/pTbVju2Xjn
         vo13Ne/9kBdNKi1i+6Gq+NvC7suqZoNR2FCbCkK7c1kxM+jkj0MKfzHEhIG/m6YP4iKi
         oD9mdavN0bUf7nmQHSla+W/KIc6GeJrLrs6l4Z1zUOgR8Z/9oDzHN4ZHJz3UgIbQ2c2k
         pfI6hPcKpZvtnta4XZuvp6fu2HUxf8s+Zu3JXmsmQcgSjrbACDBkGDx1l73vqlvwOpv2
         wUTs5edpeVMamCt0qXZnVDv1a/Qw4aPX8mrrj5RzJ88M0AnkBQjGEh4tOb0mZ6hpaGXI
         xklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613552; x=1794218352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvLqP/tFCRw+lDS6WYFmF22WIsggD1RJMNZO7NQX0Jc=;
        b=XewCpWRi4ZcKB36iyRij2vrRs57qu4ltPe7qkkqk/bsLUnMPw0Jw+6btC2ty6OmpnE
         Q19IuD47+iGD5x8hWJ/cTcFcvNLFo8Pvx0gznnNTAfvCbIJf+3kcpbvQZB3sT+I8rmUA
         JORNwUYsESU5d1PTUDUKaf2j/cLbYOi4wGCzBEbf+T3aWE7ohU9LxtHN1LXVNVJ9JYBJ
         i6hwuqZpdhj4ETUwdF5FS+uIrnckW4ir6+pIj5cHWhUoDIBVKhhb830XhTye73DL5Zhn
         ZcbwyVrbcR2l99lXxrsCS7FFwi58jss+JpZzccWLl3UsRvuwrRo82rUXkLoJ2lXJm48b
         mc/A==
X-Forwarded-Encrypted: i=1; AKwUvBy7eSns+t9BZOVgt6UJlYInqZBP2Gw4TV2opISZWGPVYTEiDKiF3kjXyqUU9xLr9uhQobGK31hYDyJY6geS@vger.kernel.org
X-Gm-Message-State: AFq9FYK3/zmKtxAKaEW76h3i9Yb4SIbqLsfta7CxByl687KPpes7lMZ9
	o3egfiBFRBT7xio3wf8sbBJ1IY/3jfT3GBiWPmCVPBa/InGem8Q/3pHB6IKQQZwahO0VHFdwmEp
	jRKlogW51cuaQM2R3xWfLNzKZFHNk71xPchSnymF++OSe0o2m0vmD7tWv3bI8EqJeNroL
X-Gm-Gg: AYBFou1hYEBGrvV2sd5TP4tBvKpv10rFCuYE71RJDr3c82SPzytSTSaJgd81czH+PTJ
	frl6+Sve3lahKX6ViUquSXre0F6UE6LvB27urIcdnR/XPxJklj6CQJkIKRP89DIFYhIt8ykKo5x
	48pv8uT69KmDk46Lrd9buPChCAx+rUltYdrVDNTy9C7eSqa8tFPOyTG4wO0d1ruGm5UlBBkYFMB
	ztcP3pSzMKQ7pxjHetzQhrbGdy22pTrNAJb+t3iNgHyeTc4KvVpS0CgIDCRw8Ewp36dT2OWhcCc
	6w7aLCzzwGrSRULUNtAQlNz727zd/blaH8YOAkgGv/iO1+whDDTVcFxdSuPGtQJ8eEE2yHRRU28
	SUMnxr+GSJr7iMd74RhejnEFEQL5sf2nRbx4Py+8no8J2WqCbyC28sEqpY4vIHxzxDTiDVZocA4
	uzujWD+0eb33/R09yBkT9IZep6ljIc6F5A+SaAJere8n1rZEU+bTPefjgwY02S
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr1518815885a.69.1793613551852;
        Mon, 02 Nov 2026 01:59:11 -0800 (PST)
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr1518813585a.69.1793613551287;
        Mon, 02 Nov 2026 01:59:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1516515e87.84.2026.11.02.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:59:09 -0800 (PST)
Date: Mon, 2 Nov 2026 11:59:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        stable@vger.kernel.org, Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Subject: Re: [PATCH v1] power: sequencing: qcom-wcn: increase WCN7850
 power-up delay
Message-ID: <6n7g6tamgj4q6k4sslwllqnidobapv7groh3tqc73lmzj2xw6y@e6ya2ozqa3pc>
References: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
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
In-Reply-To: <20261102094800.3225454-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7cRnjcXJqXSgRAe9QRAUljZULFs2yzMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX9uNS8KaKvO9I
 /iSHxkdm/kAA1OKRTdU6n9/EhZclMTeawKx54XVL0alWzZC4qkfTmp9qrr8jfeIE58Y2qDnfQLO
 ghKvM4IHzUDx388c4S9Q6P+i2pGB2h2l1kUeuKtuWlQFvMogwXwNjGZ3hh56cH49VY4WBLh9F48
 f58H3lunfw2rQoH0rv3L2ghO1qaeBBpGdGjxxFhYdAIG3Rpqt7nX2SsLM/6R5n2CS1p14T5Msvc
 HK/0sbg8JL2NjeTqASwDAg/s0lDlbmdktQBddhLUCmGmHzl9PosKdcuLSgz8kMRCHE6l0y9LaIe
 gY2QOHC8hcPrvNBIXEDtHIs459f+lD8jUP3sRA99DQZ4fIqtqEPRrEE7IGBq+7/yvqwFr9Sv5J4
 kBSjnkz6DZFl3CsGQjCjS/HDXODNZEZM3l2oJA1H5lHWThRB94rUfzBrl50med8ApaWrYUjhyBj
 ruRt171Trp8ZavWpfVg==
X-Proofpoint-GUID: 7cRnjcXJqXSgRAe9QRAUljZULFs2yzMs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX1OM1lkSgxgS+
 tepJMlXjxBJ9R5Luy//qn4rSG67VR0k09AOqnG/xnxWOseWs+VKBjTAMrcGA8KCwvYJ0vZoXmbW
 qm6Ei/PTZdJpdAmKswjPBMNM86l786c=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae85ef0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=H8z_xw01dn0BF6GSKEAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On Mon, Nov 02, 2026 at 05:48:00PM +0800, Shuai Zhang wrote:
> When the WCN7850 is powered up from the Bluetooth side first, i.e.
> BT_EN is asserted while WLAN_EN is still low, the chip starts from a
> cold state and is not ready to accept the first HCI command 50 ms after
> BT_EN goes high. The first command (0xfc00, read QCA version) is lost,
> hci_qca does not resend it and fails after the 2 s command timeout:
> 
>   Bluetooth: hci0: Reading QCA version information failed (-110)
> 
> When WLAN is powered first, 50 ms is sufficient, so the failure only
> shows up in the BT-first ordering. Measured on the affected board by
> which enable pin rose first:
> 
>   pwup_delay_ms   BT-first boots   with -110
>   50              9                9
>   75              23               0
>   100             21               0
>   300             20               0
> 
> Raise the power-up delay of WCN7850 to 100 ms. The delay is shared by
> the Bluetooth and WLAN targets, so WLAN power-up also waits 50 ms
> longer.
> 
> Fixes: 2f1630f437df ("power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets")
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
