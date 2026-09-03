Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1699463B89
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426277; cv=none; b=WClDxDlrbrsb0WgVXmJLxv1EMUebLCJ4qHx/1Kbk/6e4BMB2nA7/+b8MYkBAeL1GinAFOeJEXxO7GAWyYoDiLqasAPwiy1XLTudaV2V1xyFfGUUV0vJgSBHztxjQBKmMhDPDAb5kBoeNig+uK+om1Ev5ysBWWikTm1mWNno0M74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426277; c=relaxed/simple;
	bh=migUhAZsouDhOUiUV/KoG3AJtohPe5Z2c43aWv+zZnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S00QXZHHv5DqKxztIh8jPIgPoUdQRW4PcRt+aD0Xw3dQKI0+yjGSjohq55UeViw2w6ubiiz9N5QCPfAjnMWRQhgGZYQ3F3wmDmtY9krNS2gZ5yM08I1uRhFiwmsrlLTEohZO+ntww22Ag9S82djM79f868Kwmx4UXYqw6Kw0Jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmOrivcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX8Dw/v9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmOrivcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX8Dw/v9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923aU3035548
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=; b=SmOrivcBh0Q5qH5L
	TAXhESAjCHc9pZ1utPZAc+seTpxnn8WpD2tHG7FhC+Rdcwb4uCackdPjIimoqJah
	6kqikgAe8kxl8KudymAZkuTDZjFd7wPEahTKUeyfrRWFv7sKN4bpcfRaSlBMbu2/
	+Q5aOxXuf3vjy650/zfBlveBTf3TJK25soQU8vztHAuR68vKZKLwAk6ZvwT5q/gZ
	KAgyn3lYE3RN0Qrt4I5Yo1a4WZMwstLOZcqcnVXL7l6QjWWJFVIesY/VNV5eZ65a
	yvn3jR69mAGx7EwcC4BUJ230hODNHhw1AKtq41/aAOGRx9vWXQSob3piojMITYGJ
	BMcVwA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d1051h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:04:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8a7ae2c2so3662746d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426274; x=1789031074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=jX8Dw/v9tvpV9nNgCkCiYqZJaBEpA6yhIo6bZjDB/ibPi9tB+qwAt5ClhIanizESkr
         Rs2WQT7kfqu2eBXqlJaV2amlAGPf3o0iqlOkpdRo+cX9CgR711ah34dYC7AIJDNx9ZqK
         /by1Nuwu3mJ8+s9/Cog0UMubNMmzdRXcS9kRrz1Q7bTnW/Sa7oyBGIqnWHdXhOuI5rYX
         XoKQBCxv3Brot0bDDQKsT+msNKGPXIdFIUrEJjbRuFDAbfoqrRWP9tgN/nF2aHQkSGl7
         sTHkkfn7c0iljA0suYsRl/lnKNG1wQ1QxQtvR5b7L4gPM2XzukeKjr/EFYpxY9/YJbyU
         FOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426274; x=1789031074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=GbQP8Eh7cLG5ZKzWiwxke2ftqx6kfhk5hgwxYtRlwtVrh5HtFLewevfB8uT33YcE0l
         m/Z4zAx4rw5rH6XSQLYpF8XmUKQ+fbtfSNbCrGzlzC9OIZcvLNNhPfmY7wQ2xV21u85G
         78JHhyVAg63xm5p3F3DVoQMx/87zRiiP+rbWacgXE1KWFTIJL27TYhCJv1lbL+WrEYbO
         3kssgeEdiwCxZDBKyfJ2YXUSZbeE488o+A8e0xLy4hsRse/oIhk8f8KHpWa/0a8MW1Ga
         KOV+0D3S0zhi7/pJrMpGAqYAzqsYTY7aKV2rXPXHDNvqmZGfE7/3pRRPgng1ifWvIqjL
         at9A==
X-Gm-Message-State: AFuF++lSHRR2QJAtIUVbLljeMWcEjVfYIUuQoqoOfWpDKuI7dHPraJK0
	YoPH+mOIYmX3dksT6cQecDqlJRBDuOq12c66sCji/Iz5Pr+XXe5IAWLxh2nU/FtOB534WvtFIT0
	M5EUh0zqVmMkp9LLDM4teyxZPx851pcjDhl6KrZi3OaSSm/A26Sz866RkAPx+2xLcfNjO
X-Gm-Gg: AYBFou1DpXdecH+U+0i/v2PpqE2Vy95zNwgB96Z1D1xuFN/axemNDvzS8sIReG/uQOP
	Hm62Svd2TCTPP01PKp6VYC9kHKbdKEee//l0EqxJxgWLUAS04XMvPR3FekHUysyCIL312QnT/oM
	XEKmJ9DJhMxTb1iScwm6g705gw9RW48x8R/emtkq77sIH6uESD9JtgOpPLwln6h+o3TJnRHmQ3x
	HU9OBAMAxvLEuaqpGBbmzJoV+8WWB8MYMRL1RMldOuNMvuhvp5x3/wzCHUpQfu/Uz+FrCujapaZ
	KrYAZkMPOgyatr4uaAFHR6r2M3kFwLg1NB86ibW9g5ERVh3EbPyhuWXcvv7jfC18RMFRTL/1J7p
	WyRAMzeCR7syohTw6tCnQJw==
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80397261cf.5.1788426274121;
        Thu, 03 Sep 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80396661cf.5.1788426273525;
        Thu, 03 Sep 2026 02:04:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1952191a12.1.2026.09.03.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:04:32 -0700 (PDT)
Message-ID: <00cffd4f-d981-447b-ae97-e8978baa038d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX5syjzyzarTZZ
 DSmlJiIgcBjv8n46B0EGhlxitxGxJazeZ8m+WwMlHMJ37O/HdDf4NunkDYrPYhKO6MxAEDl8uAf
 RWr95tc0gvWEqwBMn76YKScZVtPtxU/GOAkHMQ9zSCqDKdsRPNM7dBckSKFXMtujYIEydJ9FFcm
 6mjxCxm1T+MBTmi9LQ1SeZKd6l8liR7SvFJBGRFlZTbnJQCuueq+/afIr7iF39jPRQjT+FvgzQW
 jV6m2l/tOonGHufReBRvg3Zky2xkwRauCho50GIko0hi46h3FXVA9A5eLuT1/f8iLMXYiwnrLcA
 zg5EL6zRVrl7n9xilNubGEFjlSEcXJcoTHuBNX/TWG1S8+hjRzlLs3PRtYfjGWNzc3pG52XyG+B
 6m2rl0ulJZ3aVxNf4v0+IBjfyxKOfDuezKKLuFZcvMcluodTHbnaxvr85ls0GZ9x5t3JKgPPCaZ
 MBy2B13AWY8MW1/hC+w==
X-Proofpoint-ORIG-GUID: NRS486kCKimO0mBAx8UHd8PJcsHW_qCz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX7bkTT7gVjjPe
 3swWXLt103/KdMK4DwPVI2FqmiSJlUoowBirMf7K7fVCvhxfDD+/97b8OdlVjfkniu40BmIWLs/
 n+hE4kxy/qGTB7jS66TOGGQcrCYFR8A=
X-Proofpoint-GUID: NRS486kCKimO0mBAx8UHd8PJcsHW_qCz
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993823 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260812-pm4125-adc-thermal-4c0f713737fa
> prerequisite-message-id: 20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com
> prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
> prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
> prerequisite-patch-id: 391360a3fcb2c44648ec62930e3af61d4eb12001
> prerequisite-patch-id: a1c862130f572ca027bc9c482dede8da183e51b1

In this section you say:

"""
I need the 4 patches titled:

      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

to land before this may be accepted
"""

which is overly broad and you're hurting your work by introducing
unnecessary dependencies (because you don't need the entirety of that
series and you don't know whether it'll all be accepted at once)

Konrad
