Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9C5221DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075119; cv=none; b=TWQ8A/Arg8Z5giUK/hq4lqKYQv1NdF05iQHqVYOlCSAC9w2ZGSdHDGiMK70bTe88C/6S7BbcdEE6Q2we+SCoPwD38anmB6TzRodnRuX0EchdSz5o+JM17Fdg4kVYaO4L+vZxeRlt1Tw2XSHtLnzi5wpy/GUdP2olI+osa/4ABN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075119; c=relaxed/simple;
	bh=UbQgd5un0qukt/+fB9cHHvTZOjcrEQ9kR7JHq5n/lh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQBgZSepdEtSItPZ529gRsxkf4ESKkRYFX7WZDr+JKbInoJOBbnjDvFi2fYXArAfusY9Jdgt+amyLMjssA7uKZo5kBNqGWNj429lgn/CfJUJFC0UStVBknV2jkDZuJSIiNjjCI+B/Hn7KNthwexoITjKPlRM75nO9V+lSEBP6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2cuTS78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hisv+sUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2cuTS78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hisv+sUk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7k9oa3712862
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=; b=V2cuTS78aB7dwG5g
	p+VNYNNaQvlPwj4nxua//Ea0uIQcnxZqPmLBnMURrWOKkXTx8flCiHbRoVe8Sz95
	EkPdKqpnsL5kgIfsMMF94wIrrqRM970pOujSHfA/JS1MmcAMGyt9SMMjpl6Yl+SH
	6zTobyTTi2m/GLo2RMPR+n7gQYktokuHhcFfKIJzrUyjosZ4AYlpy8wS1lsda7U6
	rZ3p5clKxIR2ryc0CsvQBxfjrefxcU3xpF19G9d45Uc+lwgVQl0uTrlyx0rIUfKS
	c/tmdZjNm5/UIK/DE/P/JSgZLHp8hBpLEkuWnpfRv5KU2e9A3mWdanMtx9ywwD7E
	saWuVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyrufd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:05:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so5798791a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790075116; x=1790679916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=;
        b=hisv+sUk9ed8+hnduxQxvfKEyzBJZ2KuXBuTBVF7sJl2mAbUui3jj/0bHjIRIgvjg4
         tZ9UFwgEz3nPCjlldhiHjpI7t8y02tmyJvkaYJ2Nil9PKMJX63JorkkpyVLASLjJbJNA
         fKE/zrqAppXj3zmv1UGZ70KpQB1iAU41bwP1H3PIXVyRjO2GlIuUzy1tl6EUbnexl9HF
         +SR3GnhYE4KQPED0iyZhlP6VlB3FPkzYjZ6zsmrFUpZH7cHafnyVDeHDpRrhn9SsaXKB
         e7QziB457LOv29ZtXzr+mV9q6J5l5fq6CByDkg9xZNMqCQpbUV0ClmLyxY4DITP6FXyB
         G6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075116; x=1790679916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpELZ5f9XpMmdmJv5+YoiaMSy8WH96P37pYEqhI4u7g=;
        b=tiCo1qpybXdxWmONx+2eausapZ8S9p/sclRa+p0ytwAPWC0/qu0Mtrhc9U0Ypu62xf
         BEpNKP1go+8UJ209ALAhjqYnxa8X37H7DH+iA47S70/uNX0CWWpDdPC1zy90Uc66Sv6t
         2Nl8zEjAbL6AkQiQ33phcaake0OufHB7+993a+NMA2YFc9ZBvxwbz6UfAWIiawhwJ4e3
         W6jFZnHZtgAUhTGTgTZBk5x5Zzyg7j1s6Rw6edb1DfBIaHORTt7m3Ez8o0wjXbT/LHbS
         mARO2Otm3vVPSyYIyKWdbQUeGT/cWDhgqSnFh69pf6I9yzXxMWAapRbTkuqx9Wj6Eof+
         TpxQ==
X-Gm-Message-State: AFuF++nJzATi6ZF8EQt1fMJ5XymQyfZnU2aUwafiQ/HM0r/iURYhxQg+
	RPhJ/j2RLZ4QtRtB24LQ0JPm4Ohh+bDzZPRv5GSVQ0f1UuguHfYhWGIdaUIBEwJX7KP79TAcbpk
	E/SxfD0ps3pgS2GzZQQtE8l7UWTCgfzr+la37xZxB6HzpWi2yVX+myi3K4480uTllzLZY
X-Gm-Gg: AYBFou3GaoZ0gznBrdjWMOjtYzu9kyXqSpxsc5i/RVfB+r84ogzmOFfKK/Fom5fXUgf
	y95rAJd4tIrmShcdie08OfQ+Ye66fvprQp1ss4iZJQ5O3PfwGkz919rUau1yfohda8r/sOkcY8U
	C+csaBDidtNDgPZcu6WWwmWjAAhcpGiM1TDG2H2LpEyfRfDDX7KbphTyhgCzZ/fpWpmB8/oKSQt
	ttVWNRrosdquUzJ+JLKwF3PILdZ4afoMn87bXjsmuW0SCwwN4QxNU/fCmRTT4t8oMKBIO0cYhmL
	1jJOyxGhc3WFYkQDBfY4AubQScErnAYolVazrZBlss7X8OhBchWcBq96QKr1D/gYdQsNmtWRsZh
	9mpKQqhjG88frlvXxzbE6U5tDIZN78y4KNQtFdOAu6ETEUn4=
X-Received: by 2002:a17:903:24e:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2df609b0c4cmr8781965ad.2.1790075115979;
        Tue, 22 Sep 2026 04:05:15 -0700 (PDT)
X-Received: by 2002:a17:903:24e:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2df609b0c4cmr8781755ad.2.1790075115554;
        Tue, 22 Sep 2026 04:05:15 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm6822733eec.30.2026.09.22.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:05:14 -0700 (PDT)
Message-ID: <c802e9aa-6261-4dd6-8229-8c9862965d87@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:35:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-4-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ufC6GBpEchAGrtaIKnLQVEDeJYfMu-u6
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab260ed cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE2MCBTYWx0ZWRfXzNx4h0XyruMy
 lryOi/EUjiloOV7PNq83tSSS9J+U8arp+ko+iVYGmVnqHZgaOeruxgry0kSqeWaMhCG7iNSsYwK
 rBKoj8MLIhRAwXa2NH8RCRbrdZL9QuhZwxZQGjyeXYvjNtdjlyL+PhT3VoxS/c9zK3UtF/BAKAM
 53/EvfFa8nlmhoCPEyd3bx90gAbimKtnzouOHTs19HvbKfwp48JqPVkclo5QMDAHuHhRJyFYif4
 iA6UClgqwsR92oxgu71wEohW8ia+9NOsyOd1QWe7st12+QOi5xtr3ttzVehnW9iY8SB9Gxds9h6
 qxgMqWfHgdPnhG6nY7n7qFekF6txZxNdA9ktxVzo+vNOQzjaaLeQ4diSduIGV/TIc60ZHe2Cgkz
 h2cDbUn7ytlDxKfa5awhfPmeka/2wVWGILI2Ht2IvYhhBLDKTmz6T4BPWh9UGDsVYSEtRb1KLju
 AMs0j1T8AjjZtUDhcMw==
X-Proofpoint-ORIG-GUID: ufC6GBpEchAGrtaIKnLQVEDeJYfMu-u6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE2MCBTYWx0ZWRfX7MGAQwXQftkY
 FmJNunDNSVIWbZh90pHcp8YlkYZzAJeB/ZtlTGDLif8BF0zFJau3K2GcNCUM8srZraeIzlSYoOy
 pEoamwcNCKCJVy3lwTOQYAFSNy5hRcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220160



On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

