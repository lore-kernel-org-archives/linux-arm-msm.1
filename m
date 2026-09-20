Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB3391E76
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888777; cv=none; b=l/gv3jUY/0VLQNRzVzSJl+q6Ow1eGak8xrdjlgk9HEwHtLTRA9LZ4IDY0jrOUmSIl79qZvRRKLzgKZ/IdJCTE6+RXM4jdvY9y7hq/pZ6zlB4OvMrLGQtZ6AsMDj0n43PvT1Q2C8cW3eBN3O26//K/T7EUwmyPWiSEvZOtTTfDxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888777; c=relaxed/simple;
	bh=1AHr/cZDLYgzWqzLtsRYID/EwEqOKpAqpoxbl9StNXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcTckhEU4upVrfIWYoGVg8/Pcne+nevPqg8P6YdpGubuN9xcLA5gthTe04FTt4OF2YcRxtHoLKTaf52ueWCAt7IZnc2j4RdPyb7csBK7Wdmv2tX+oygLPs0R6KNTUgCAbbPkcrza5X52Woh8OWJzflTAHCoJSw2F0atp38pCBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hxq6XZli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3nzGc0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hxq6XZli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3nzGc0y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K553k6826230
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X6Czf91RlGu4QgdZcqEUbxtU
	bWcfp1ToKAncC62o/K8=; b=Hxq6XZliJ05+3Kc8PEG2G7SFpszYPuZR+EoPbpQz
	3nvFbt53Noz8RYQf6fZ7aNXJJ/VGTXlma9j6ho2u/t/HSd/PteE4U0Q1wxUw4i3x
	K3XxcrQgNTgBbiiw7HZgubolBuu+n105aK/xsddb/NRjOjszd86uUP6Yygq0NoI+
	L8iVJgnegtMFqy9qkvww8l7YXLzRqYrB7wc7++tetJekgcn6rlc2B3gAkf6zP3e7
	Yasyp3Y3PxvbYSptiBJEWy4qtOGwF3sXcMwpl62hUmvB9pV//i3gfy28rQVvt8G+
	nZFCLS5Srge5og1vREgulrXIcAPY1GAZiYUucsSddqWxiA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82dtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:19:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2876426a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888773; x=1790493573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6Czf91RlGu4QgdZcqEUbxtUbWcfp1ToKAncC62o/K8=;
        b=K3nzGc0yLEjICeDODEH2fWJKPVZRqQJqY+JfDh33SHPuNIGN1KugfWex1LlLReMrFH
         axpjQ//cg94e+c8QjD9oqaHQFT0Rm40Rh0KYIG5COiCbEFktKYm+fqgU3PE37xIWnLFO
         E9TBoKb68aLt/rsyr/0s1HxnGRlo6kQZxT/cEcrSl8vi5aCZ6cMgRxmo9y9ClOGG5Gbi
         5jHHwzwNisUT+SU0tC1WEphLgriMEShVhNG/9i7JubkwA95cHAlAjoNJ/Mw8G2rSaG+6
         v8INNWF3ScPLQIx1T4yJz46DbEBmQAFviBZSwD/88FLKMmAG9OzQo9zSpWBC5qEfvlqC
         EPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888773; x=1790493573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6Czf91RlGu4QgdZcqEUbxtUbWcfp1ToKAncC62o/K8=;
        b=rFsDRBf/e+Ha67NrLtyt3uKfZSiDiiDcPOHs5NRkhv86aG2Zc2NpiYAYhg7pcbnZBT
         yc6QPw+uk+CXUYgYpLE4B9Itorr3rknPtSUWTjd5CIshEHeM2a1tdzLnSQ76Ho5Y/hNn
         Y9o390yh462gMrtPUtcxmwR32EYUITfC8dRlwJGK2mNaJVkuCBvjnLmwhFPVm0xFbNPD
         GHHKPYySpMyK9jAximx63/9cNR+1hi5OmFdQftffOZ7J3937+VnuHf3LidObYlS7U8wX
         XVIsEzdUm8yakmoV21AetKzXE4ScRlCl4tZY0q+ppF2ZMfKqdTvi3ZRvRxaAPsot1u6d
         gGMA==
X-Forwarded-Encrypted: i=1; AKwUvBwSrFd1BeCfCAB5plohHw0pqZF2ka5keMFRHeeS0XIZYzxDX1FVLxyQVDERZm8IMaXoyW1gvJdH1BtzprNZ@vger.kernel.org
X-Gm-Message-State: AFuF++nhq7PM2YBfO5xQRebLuMqqRoziwY5Nt640iKW2FqXcq0HFqV6c
	ie3fKkxr7uwepiwLXeFFHnSx7M1IGMROb3HIZo1WHyuvSygc9kGY837JtoLTADdkulweeVRlvQT
	yeGhKTmMQF6uICx6SdoIBsImcYiXCKLfaQkf4EvX8sDYMJgUNIRpoMlOppfaf40OyRAxB
X-Gm-Gg: AYBFou0gz+NBpvXzXSrMt1hcoDOqh6+FDn5ZosJchs2e/f1uAarv2I7a87rn7TJmQsC
	qiz78tHYsc7qmc3yVN2UyzlWYwWXWkVeLTp/StqmYKbGDhFbUltBizjcP1VRhQ19TR/O+plXMCJ
	7ZwtwXQyGdcUXMjKe4Bgw1Y8IDgfXtX3Wn0ZVKBlD3ZRLCyPwOfY0VHU/KHh0bdgWvLImZ+P0ud
	E8TFDAu86FafUT8jA3h8Olzi2NIoYjdrc0Nm2mSsDkUujotATW65MNnLoz2qZAAAFAIuBt6alUH
	8Vfs4428glLP0THdSAo+DqwndBgJclTo/CRj4wqNqc8DdMIohumvxCbzTPiQrjqBSG0QH5omFud
	o/xCu5v5Y7QvDwax4pzcSfy1B7feL4FhEPhU1ZzXfRg==
X-Received: by 2002:a05:6a21:178a:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3dd8c57a4f5mr11492530637.31.1789888773433;
        Sun, 20 Sep 2026 00:19:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:178a:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3dd8c57a4f5mr11492511637.31.1789888772891;
        Sun, 20 Sep 2026 00:19:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e29absm16867920c88.12.2026.09.20.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:32 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:19:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: vfe: Add support for VFE gen4
Message-ID: <aq-I_nDC_ua3elhY@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: igUvepSATu4CyCFIN5LDc6oTgL4NHPcL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX8mCGqxo1iCti
 9Y8mkOLMX3cxLuobKecyaRkYzusc2e9g48+198yiDyIu2hE9tDjaoUSlOtY5rKbVcDjOnIW2iE8
 lnQwwt+AgiTD0XTGCuXdk0DGr7Sa7/E=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf8906 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l4MyZbu1PlRJkBM_CE0A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX88aK12uvCc4I
 hgm4KnaU6WX8s7fKFRr+ZOQh3gZT5jeWDAl9/g+evoyOzQddgCwgIFmehoMF5VL4J9MernB44+T
 gbnlICy3J0ClkfO/hYL8AHjWqdYLuL6yvdtnxk2NO360YXOevKRAJJfTWDZIfJwX+jWF6/HOzTR
 a5PoJbJ+dzuktVO0WXkCfqN325tMEyatDJPf9W+NDgNzDK0O7dEAQJdT+xVP5vsFyJ8vReQbVQH
 ZXQ9PNkbBf10lZpqyT2xKhmPQLS4B9EwfBmi4/IXUC7EtJnJe3TzVv+UZV3r2vB2y20Pe/MCixB
 bC2AjmQOTzSKzaEPEDXx9FjEZLgroV1gmIFoLLAvuHf5FQabcpE670azTy/mTx6Eg5M0V0Q1k1s
 +vSONkUX/V7988JqpF1PV+PYZ1DlYt9/ZdolLJ7dlOAJgAoYBHeEMes+baBINBjUTPNNhztb8oJ
 azVEQjDu3nJk/aP2hfQ==
X-Proofpoint-GUID: igUvepSATu4CyCFIN5LDc6oTgL4NHPcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

On Tue, Sep 15, 2026 at 05:34:13PM +0800, Wenmeng Liu wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the VFE (Video Front End) Gen4 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures

Neither the binding's clock-names nor vfe_res_nord seems to have
camnoc_nrt_axi.

Shawn

> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
