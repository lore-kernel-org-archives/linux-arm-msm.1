Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A4199FAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768170; cv=none; b=Xe0p+Xm6dDAUOlg+RGsXBgYFwuVJVMZsBwJI8quX5+v7KUonMdoDXu2ZrUx9YgE0EEZVdAyO28FjBz+QRecHuwE3vWm+yHn4w3GxOlEDS4Dht04aO0dXWu+0DNQGcvNPtfpzOYMfmpswO+YS5l/Xav8dOb2C+xhkvu5afQpDoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768170; c=relaxed/simple;
	bh=Dzxyn31K18wMcByR8vcSiO2kisz9KWfmZLWAn2OFRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfEXSy3UBDuWXf+yzoaB+L4D3aQGhi8CDyNr1/q4UriInpRqiofvCLJ6OBrHGDO29A/ljfC4Y0xXbH8BylwFCSFWN8S5AVpujHg9z6/ZJG2aPCC0df2AD38TfqsFrNKPpgsN0kwjuMtzz6dJL6IvPbhJ1Ugj0eYMGe7/5oujBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx8mTu15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0nx8zR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx8mTu15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0nx8zR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777P8O3352565
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=; b=Xx8mTu15gUC2hCdS
	d8UrURUu3w9OYN90GrAGEB3UeSXz1oXSIoTqPURho5FVVCp7fhdH6kegs4uF07Au
	TaSxQW/YcLG4LBSTgwq40i5NIrI+krYDB1HVaeTdCbtAyl8q35L4OKa8ooqdM3Xj
	IFVaPOOCsL55IGjSlRvagHxiOCwgUfrXVNjDNB0dXORy33ALxUJcmG8st+luNBAa
	0ZkpG24B6cnHE2GoRRhtA7l3Ogub7z57KC76mC2lt2mXs4I7sjM7x2DsjLSnNihT
	xTXeh5UrjnMIduE7s1IU0ipXA72rr4kKj1IHHYMDC7HBeNOjc92yWoFEKAT0N74b
	/7xBwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gpu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:02:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52e4919be6aso5204671cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768162; x=1789372962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=NO0nx8zRK64am93qscSzzkrkDIA3fGzUfxAAHXbjEaWxlLZeKQ0DyNYIVr05zJXuQz
         n35mcLtn58gmMrqZufiD+KhikrlqWCbTLMv59QQ4BmSWn6lc/n8XoiYherMcdFIBYc54
         JNuUHtHkEfKxEwuZwq6BYOZDDMqjBByk4zjx7OEE09pe50lv0KHMMrsq6BsPSRztyrHL
         ma8uL7g2EkHIyaRPiDGWOUwLskkrjibTJJnid2s79b/LpRgYERsrMm8nN2yklMHc/rb+
         Yaf1sGwUPEJ+UgnGdNBfrxNsUqHS6s9LKAMl1qEdRtmFjyDIW8LgE6Qq5LkCyrzlkNYm
         E/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768162; x=1789372962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=At1YOU0cUV8Lonhuesne9LcG2XCiPCb1/Nc2I69p65ItVUIQnr6ekf00CCzTEMwP5i
         kE4pe8azAkjK6WYG9UQog0gvdl//MgUf9kS4HnX7kdELz1YX/Xs1LGhP1iFDD27ZTIKC
         rG8+pv/xV07Dhy6ne+LXIHIATuOaPH0fOIgn83xApMkF9rHi0m6duev4QANvzQS8hQ31
         DXGgJfYb1wCU5HtQA+n+WuxIiovFzBmsb+hYPJuJQO2c1qZ+JOYB1BUE+Wixjm1YWpC4
         VWG6znLmfxCqRgbddgydBWYmR4gl64T4tn2Xfp4OLuBfS5vB1aT2CbFCwvm7A4YkNbWV
         j61w==
X-Gm-Message-State: AFuF++ndXt19Xo1eftjsJPcuyMO9xHXwLlKulfotVnQfKAbRdejXFLzN
	z+XEGGevrxevDNVIerJtyq92jnqIgAwfoEg3GXd+xYfx9egwJV8JrPmnOenVjrxFYLsHdp17qhv
	zDZji7RHvn3gQzMRsePk0U4+J6bqe/mr/ifcUb6p9DsTsuOrqBQHj8KcQbtL+CGEE2IKx
X-Gm-Gg: AYBFou0sUx2Z2MyFvRTJ/O6kvzW32rSt+Y2TzMKIFmR+pqkwxr4Cq64/tA2kXT629mo
	alx0wy6hkDF06TOG52ZhAruIr0SI/ItvK3PsOSPTdjtrozhfQ1O6Ub1zSZd5prWOTRwE9NPBZEw
	ZCc/2jDhoUOBI29PINt1yyv3jhKcSHhDXW44qWLIqlYVe86eTfHp+CUIhD+XMYA5x28pM4zE/sK
	Ga1FGrwhMTGBdRfBr/K9YfufNxUnn0UNdohSzrZWVplLLgHYXel/FOu2dgAAzE1PaMP+/YCAb81
	cdIYhxaluaY/GaQmT0C7HrV6v8dNZdCHzVAqd+oVvSHqCbzXlk57hFhWuHgt+xOo5tgO5EhNOoH
	c87UuxAPIinMI4M9YzFV1cg==
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84190385a.6.1788768162212;
        Mon, 07 Sep 2026 01:02:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84185485a.6.1788768161652;
        Mon, 07 Sep 2026 01:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm433050766b.23.2026.09.07.01.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:02:40 -0700 (PDT)
Message-ID: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e6fa7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZBGtvieuKoO4biM4d7h5GPq8d0ofxX7S
X-Proofpoint-ORIG-GUID: ZBGtvieuKoO4biM4d7h5GPq8d0ofxX7S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX/clm5THHuSKA
 OjKU4t2nq35gVq5jkRzZbkzIPLu64SxkT5BcqnBhoqZmQgr4KTeG3TjMngXtmJfIQtAm+IWEWo8
 DDJ6xGmSmGyAB74whAHqKRknvx9fWz8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX5A8MWb+OH7Mx
 QzDElT/GRk9i99DuaROGt1DbvX6yL5JUMl9V+U2Z37yCi7BRWeKf7QhYktHm4Y9E9GRc26tztU7
 7FLnZ/vcLZGVbR6uEf/MmX1ET2Xf7Q7E12P5ar5FEQO5raJQ3wgkcQ/s26jNLEDnryUhz4UIpxA
 phMgOoAZHqW5JMdc9LJSx40xQSXrerxaFZqy66fxfSAztOqf2YiA5EqYNQ/XPzZmhix1GpfwCo0
 a4YtdqX3dXnA9TmREjQ6ipIyM4FJmFnSNVD6HbSk4Ikc7yuIhokTyYTL7lNgffeUnt7/SGoUpPp
 dRowLGTPAyhmUciX8kmS5gCatS18kAJ7fBb4NHIgOU86HTwMDoG3YbfbMbkNILEXTd26wo1xgva
 1fG4x43j8+ho4Vp84JsYSm+VxJQFKUdhrsB6X1+U77ss8o93sYkkal7tCY9qS6LLa+Ct5/7xjoU
 kiTmB1lehCPMBS+zwUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070086

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Is the no_init_park variant an actual problem here? When reading back
_CFG, is the parent preset to the UFS clock (which isn't running)?

Konrad
