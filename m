Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59F401494
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659980; cv=none; b=K8xleY+uqKkNTMjz+ZqEeQFrnWYxFKGUcAjc9iDEAfbBxmVPfU4e+DHyvUKSvLy8I3FCRXunKeZUvCxh/5fN9Ut13cLyx8nBO/h39vdlJMSy024qVmKE+21LHLa1hVcfv0rPlIq7JsNkDuC/qxxgFVvaoX3Mxt+SjhgqCbulluc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659980; c=relaxed/simple;
	bh=Zy/uplELbej2l31ZzUf+KHC+qlsRNpMsRObEQAmlf2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzv00k5kKloqys1F2gQCjkOXXe9RRt0eIpMYWrTv6mozBqS+2bYVZy60D2QGWUqAEEPjUno3FLMg1FwBqnqhcgYxy5rLM1ArqSvIBGr+gQM599BglBBJ9GdSI682RxFggjQKJB4rCqXhzUzGYbNBzvHeITEx5j1/DuTWzlcQ70g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STOUkQyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRrv3QaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STOUkQyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRrv3QaN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAv7Dt1761509
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=; b=STOUkQyJC7MwAcPo
	Lbed1T5mcuXzoWZ/nuwaFsLC6jSrjPmBAWI6RJh8b7LtXeUfHOhZRtsXfQxf9Vqp
	KCQNJJ1FKLH9Eq0r4aRYaAjEztgCNCPhurViedD2PdncOZeug+uuCiuBLlw1VUVH
	t1C/yMCkhhJVUPN8CkycbQvVo4tfB7wjqggy2VFEDxKNvB53bsInutWnIykI4G6l
	h+N/Sb+lc1ubOSbSrz7SeulJL61RzM9eRNMaX9i5rMxhcUIafUFJzw73JXVJUWf3
	MJh4L5jgK64xm9wNlWGMNkigYGmk6dmc7dofB1ZwJaPCAMRKzCqMvJeKwIMurqZ1
	BJjszQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abs8m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:12:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so46168525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787659976; x=1788264776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=;
        b=BRrv3QaNeTjSo87ZDwyB5xp2VVjoiWYSLVb9cbx5nFH7E91zKSqMGZYR17cbrBSlVt
         QwVWmUGu+24nxdkXvk5kcHOzwKx+QOHXkdAMmDFWKiE+eeNpE6wehyYxvWMjm9ydNUqW
         c5wo5nv7t/rLLiHHGcy1/CFRRpRIk2PZ9MyI0UNA2YKb2HA1d6T7ZaO7mwL3ZpuW5Iu8
         OC+yUuY8S6WbjKQoKmcERkHJpCYefBem5oQOT/LdbT/w0QtB830ItWnBM67tt2p3G1f2
         wSStJd+DB/nF6/G7xZvcetQ5x/j2wSZVnVYgGOMv0PJ60SvLrOyeHn5QhJGjVl05/xNu
         1nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659976; x=1788264776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFYBfDMFLN7EfoYr1yKrbGv2vHYSkMdELyDJzYvM8Ig=;
        b=AWem4tFwpjrFxxZG7ctK/a7Qn0CWZkit40aVikoqLEk+V2hgJCatO/O3DR1YnqyFwK
         jWrjm4HRTJGTGahUFlsXioz1tR4HyS19ariwyGIf9v1nKWAp2fqB7ip5ZopKQ5xWEIOl
         hX8CploCEhROxGJJM5zEIoUN63nQNpyuys4ILBKpSIh9P50CqJIgCgyJzZ7n2SFLqTw7
         r3lBIGJjme2c2CJSyj1Eyzp0kVTkcwv+uWzYEIQMFs26NQkZlGXu4vOzapL869SCzoxa
         UcrlSV8btC+RUMgIAztvQtfn1P9bms8hARNC63W+tHFHHmPT9hessxSBa9R6ZTBkmvf4
         YdiA==
X-Gm-Message-State: AFuF++k2Kiep03dYQIfYbMDGq+MSwY/zpWn7BBBN8bFTGCbetsCo8SVf
	mpxD9tnhed+MFfR/5GBpP5FrlmL/ZvK1M3UdpkNBbzYEKzr/s/p3tZnXrfeJjxvSQvsFy3LS8S6
	YLBpMqRdY7zJGkl43xhivFSvklH2pK1XUN1JF+hTrVto/587cHO/JaISz/gtDkXq+wPb+
X-Gm-Gg: AR+sD13RP1DW/4cklLD7q9zxICVXjr/nFR7PcUoSl9hSvfy9MsK/N5FN3Q/Z6aJ22sj
	40TUEQXjAw2SWIezQ7tgWKYuG/6Neqsnwt96oCuopEoAxKApP9n9T3bSVYH+q6t9k0mc9gvagco
	F0B5UxBSTpdOKu6HmnlJ1+ASpBUjpKPakv7epGieJenafOnW7MePl7thA7VrkdX/03jWI5z6dp1
	PaGW8aiRJ0tvjK1BUwmyC66DdPXb3ddCwtRKBOSdQ6I+UBH73lIM7rG/5KRf/utUpawTfFRtUzt
	XOrdQGgKDWXAUnZYO35xw9o45KKLWMbFFOTQB/m4Fx7NA9m6aTJ0GyYKeznznqep3h7ehHAVzpN
	bSgrQRPZrQ14PDDJsr6omBAsT2AZ1ijk=
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr652487285ad.6.1787659976004;
        Tue, 25 Aug 2026 05:12:56 -0700 (PDT)
X-Received: by 2002:a17:902:fd8c:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d64addb782mr652486155ad.6.1787659975506;
        Tue, 25 Aug 2026 05:12:55 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768d9241sm28068785ad.71.2026.08.25.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:12:55 -0700 (PDT)
Message-ID: <c9964dab-d396-497d-bb67-5e509fc8a085@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 17:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
 <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEwMyBTYWx0ZWRfX0fWh31h6btrY
 1vr+hHHi+CW5bulAULOTBRo4g7sTDqSeJy+IEkBPVmowI5Og56BhV6vGFf/Xc9yirUTaM/N4InI
 +GfYkzqL8xcQMjx+tuLXW/XnO5poDSv7q1OtiIxybHsuE4Sps8gDp+rBM3vFq7ljl+01j+7IwVy
 OIDtL0o5J9FK4JJstt0aQJRXq7aA9aoNWYWw1/902lUbQTxHVnctlHLBYJvDY+9GJtYtOcY/5g6
 nIpaThYHePK5S9lM3XB83SjYc0ULFzzUPt+CPsr95mj9whdFcqqr9B2q5tu3/WJqXDdvv0pZlRS
 ytEJbU/zugTFeGN2QJJr2u0It0HmhmY6wfz+7YKcIztSj1DAqRIQOOZhZvJAaxZgilnghzAxI1M
 idy4yIfw8Knf5fjATZjK1yF6r0WzLYw5WrN1P403ai82d7Q3N1cQMVnv4sgsf6cZsOMBuSUNYOX
 oK0c1Q+RxvbDgTp6EVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEwMyBTYWx0ZWRfXy1HTd1jLG/QP
 vC5g90RDfQuznNFebnO7N9iDnlp+XMNYRmWxmmq45UoENS1PW4nT02d6a+9z1BPSFxz3hPx5KMn
 xvrAslF7FTtImPMizDY5QeDUjmA3pfs=
X-Proofpoint-GUID: rJMri1htSC7UQCW3Pp0tN34mLkwB9YOa
X-Proofpoint-ORIG-GUID: rJMri1htSC7UQCW3Pp0tN34mLkwB9YOa
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d86c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KkITgS1P2qNXoWSfFRAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250103



On 8/24/2026 7:47 PM, Konrad Dybcio wrote:
> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in talos.
> 
> [...]
> 
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&q6_hvx_alert0>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>>   		};
>>   
>>   		mdm-core-thermal {
> 
> Should this sensor also be bound to the rproc?

Thanks for the review, Konrad.

Talos does not have a modem remoteproc device defined in the DTS, looks
like modem support is not present/disable for this target.

> 
> Konrad

