Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB03E4C73
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409947; cv=none; b=NfwX3O71YyILLFM8y9U+rqMn1N5rUx08uoQ/5uOuZg/sr2cczsl24NEv3OZ+mwjUgFNDY5rlvm3Kydrj2PznPyOnAVeEYb8rfJE26mwQ4+Kt6Muzhp/JrUGOnEs+TCowEGDEwuUTJFwBlHR1u2uAKwQdzVk35at5Csx+PkBAnQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409947; c=relaxed/simple;
	bh=yBvJQLFVLs09NmJ//NAODVkTEFC8rjZkz2dfzZLVDxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR1hSWgXJp26d1fQ/vJkELoOv6kAEw+Uq73PkLSxOD326/1kvQXFoppy9KVXx+G9z5ZiVJ/Xq9n7fWPh6vkey9uKJmBaxo3Ui970X5TJ8m8BdtkQy4zZseln9sQElBllaeGEVX7+fMcU05TI4H77esQROxDiXvlj2IPFhEYIv1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMmlfvsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUwcIX6E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMmlfvsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUwcIX6E"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuDV2752288
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZ7+ZE8bYc+JlEfpfUZf3/SB
	Y8q3s+sbzAwtbI+HWjg=; b=lMmlfvsYCUbPgp18SoKrqmq9OEORzmDApCfwAAIX
	UUFTldDzb6mGFfOL35BEerc/D60Iwy5KPTr8SK3jwWFFyxqiK8ib+TkoJF3KsdIW
	yuEhow3m3dKRlXSTslP35F+vOaRQst3zI56XfLdVx7FSNiONqtVaUb/IXIG7bSVu
	BJin7PNPKCtXnoMNVOgEP72zd26g8CvtvQ3CeDQRNw5q0yw1Z4PNK/lB0vNgv1+e
	7YtIst4QONVwkRcZEEziYRLMUNpgMD1j2cgdfFjTmwb5fsNrqiP3pgtAZhITsbp0
	CLTHRB0nKCuZdmkwEsPAI84lZiUd+L5TSFDEReyG2S7SlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gukr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:39:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so347385285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409944; x=1793014744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ7+ZE8bYc+JlEfpfUZf3/SBY8q3s+sbzAwtbI+HWjg=;
        b=bUwcIX6EDjVPB9nJQI3DTnHu/T6LJssFXCYISAIy63+exUvbuvDCNVPfoKjKUCnoDl
         uGpt2cbZO94+N0suNEvp9gPpmboOgq8FyQbRyCk4GEGDuRTQLeIzei4Rs7wU2clZr9Ht
         1g1dBv4eFzoaBGYeWnmR19h5caUFQEfrjUc+3Cf38m56fyA9VZKXDH08N2+QTSKnIjoN
         QyLDO+I1NT3Z8FipXnb9j3jK8NDWPWgZUPaUzAzV2oRGzQxR9AMt1pZtHKIKKYzFL//0
         eE5g2IbfhftyNw+lzdyDnCgkl9MPt1QwQIczYNqTksuOPipwiCXEZDPQRRYS0ACB67I6
         RluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409944; x=1793014744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ7+ZE8bYc+JlEfpfUZf3/SBY8q3s+sbzAwtbI+HWjg=;
        b=iDbPaW8539SnH39o7cMigwbMdkirWxK9Nwm3Lfp7zpeoN1uRnX8TABMohszHDcpcfQ
         Uz0KZahp9z7tmC/qABkoIB8Pn+gIzc/V+Foh2PcgpO4ejsYpXlIcT+LJGUoyZD1mAiyF
         858MXzmeFF4HJEUZTRzgcgPrrn+ElLM8H/5+AzoIaH1eNb7wJn1ICdkpG9ClU4NX6F0z
         RUHVwwsmugfKElZDarI9ymSyClmEtqNJLXKyRTh+XH5wl5Oh/SkMiN3laW7vb5Cn3xnE
         IkLfcjHO4T93chXS8pfJyMxKHIlN64OFzL/wOA3zdZq/9V93s7E4LKZ5z6jz7A8ALrq2
         2xcw==
X-Forwarded-Encrypted: i=1; AKwUvByvAZA3gJ4gFhk1sw3lglEC0KtG09LAKbJoa7uPyLHZDostjRxqV2/rZDOH8tvbplSfRqznYfxi4LN0afQ/@vger.kernel.org
X-Gm-Message-State: AFq9FYKP5/zrCLAJXo+PzeG5j8nAYINsQU3AOKJHIJgwKxt01xc7M406
	70L19TC/PDjjBSMsT05cZKzdgYOPg7Q2L28NfZ7pteZd2GSTr8dCk6Xso32MyBrrWLeUWN5jlD0
	W71m0ggFINL4XFHg1oEJfLT0zlEUZBwrOOSZ7+0Xri6htyfX19aiAEM9e00QiuzBZaSSO
X-Gm-Gg: AYBFou118Y8f7olpB+8rqtPaJHGYS/DOo3+hTBCtKLK57gTxeuRSBUp8lsrjVBO5YCC
	fbdSKlIFxiDfDSHyhWu4qhIx2yLUFQeMCA1gR9uVs3iKB2ZH4JuWoB5GrwtxRWkTctbfkiPB8lb
	ZILM5bYZnYGl7dsdMmkU3TGyhkeya8xL9UBqn7p86LWpL91JSfBPY006UM2BUgcWGpEpXgW0O6s
	qm1n7gbks8ChRdd0vmv5z3a6gsNa6CMnjExlHG8tJ/IP+usHvsKFPW0dfUB+isMf8mKxnWv2WCP
	JOSC5ke4rLIE0evVATHVBKldtizu3gbIrq6fBB2UYa3U9Ed22U3rbj9fE99d/4jpTosUlDkl2TU
	6iLxH5jyQ1ilMFIhv
X-Received: by 2002:a05:620a:31a1:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-93f29d8498emr1212235885a.63.1792409944308;
        Mon, 19 Oct 2026 04:39:04 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-93f29d8498emr1212231385a.63.1792409943672;
        Mon, 19 Oct 2026 04:39:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm196186605e9.4.2026.10.19.04.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:39:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:39:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
Message-ID: <gytzl6qdv5yt2solrssptdmyhbtobfafirx3mqmnogiyrgw5g7@ntmxiwmmcztl>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX/h+361+QQ727
 mWxpFnRTAoDnhKgNQmYNXfdEC9Wl0ZMCB8Mx8hGHazPjqKXNswbFq27VQAebjwmY9Z0hbdrNZzP
 uc7REVM6w/7415Rz/+/Z/DlM+kCgMzbe/9S2pBzNWNe9/HwGpENdhIE5hBMmM2OkJvcnKBwa6KB
 LJafeBbSKgHUJ3tq6cZpdpy5Rlef5qgC16epTxB9mj0ExBC3ELi3X77vUjTkxBMYy0MS3d6CY4V
 wA1frEyIH77Iy/EDmOXTIyq6MGXyUO0GQqLMOqfyW4cycUe3c+6KznokhoXuc0HvQtgG7/6W+w1
 jeCurqMHxMg2OVrYIPOY+Mgg5Al9uyLjq+2oCFye/QWSCb3TOnjbfV7trtef59yl6+AzKslec/I
 H0rknN9BKm8K6IAaoLUv/KXbN09wYq02BUx3IUrVxag4Ff7ZxKk+REsGceqRAwgRAsnredys2W7
 wDPodgLiD+4q8iKbwkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXwsSXYu9x/rIW
 6L9vBPHkeCkqSwqOSdNLMi195Z0Bsvywpqt3bsbTTOUITG32zcgeA2diZhHTraYA3xgmooAax6A
 AQtg+zIic6x59OlayUQ5JoPpbNN3Vtc=
X-Proofpoint-ORIG-GUID: rCs4tD1F_qc8nE-OypDOWJejpPeHYxKV
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad60159 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gMNnsTi2PY8_Sv5w8JUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rCs4tD1F_qc8nE-OypDOWJejpPeHYxKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:01, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
