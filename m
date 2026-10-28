Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223235;
	b=aS5AD5wcOoa3CTo1QoH2ei+QYWPcXVbottPDXzTmQ0CQOLp7+TRTMcTJSpM214/rkn+H
	 0uUXZIkOuZIGS7t/REVHqhEwKhrhy8htE41uiKpOA+SREbeiHF8iGNL5UjgOhksVjeR7s
	 XX5G735HOT8Iy7Zm/pOq1GKgptJBCpypeaSGHRp0mcaQnjLgkUk0jzp8cI7X+zFtc1+is
	 rOEfWfZNCsrKS+LszSfvUBydWrfaFzpc6jqaCSsUwOOlxkA0XVnAxm7axHhPRM/cdqg8S
	 /mpgLtzTHtg/BNG+8anmNA2/tXyghKWIf/qo6HsIeY0mTXgGW6QSh2sbFa4cTjbpvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
	b=fS+t1Czz7faOCgUhlgEJPQhYWqTCgmkzZcIPvGos5CE6QNGrZ3wlG2VzmsDs84ZcB0gs
	 gh6SHbhJFAI0UYmOmz+hX9rZoTnvaF4xUEbTbV/GC+5VxumyXgCgDvfI6fvXV3nVEDB/d
	 Vl520ksbJklvcaL/Eo8iFaRKjxsTqUq5Ey77dTZMd+s4OfA51+tk7xyN2koH5ERj11e3Y
	 nxxdHkL6vehyLtyg4YzoUI0rKqQoN3gdQOhoOR/vB5M0ddO3Vvx5TWRXT1un4m/Z0jKJ1
	 umprM99HCook1D20Ll2XvBNYti8LoQ3aTDHGG3kqeVfher/YWDEhVv5xLzkENzB1tPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYHYd73t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579A606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9579A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYHYd73t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPG7G2994974
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=; b=KETUDgnMzsFH0FtU
	B8sB6yaUHUIBaLV94NO9tCO01n/MGxJ/4JhP1CfcPFMUi1+1blbOi5AOm/6UxYjk
	Cj7eR0dyK+a0RU3zYc2pLt2rl0QXQ/UKo1OD5kILnYqJvL0iNgOh0Iv2iGMvb2zL
	9BkCey3M2v+FZomI/+ZoMWwA0WrMXYYQ+2lVQyv0hAhr5tcuxtOztCYrClzDLzcB
	nMI4lRvV3FqaNXhumsm7SsGNoLAjT2hVSy4TXq8kOmAQ1XsHzl2jQ4T0R99Qx6km
	cYJG11myJNUBOrqsRnJcto2Iq/I+cNs60Kf6J2LC2X1jCs8EkSpCssp1oa4RUkSM
	60IzfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurw05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:33:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so5635144eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223233; x=1793828033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=OYHYd73t0OYHJYTW1+XQgFsUyVF17MeWedMcglAlXc94WYbyd2snI6BozYkRPyivhS
         RjIR57vCNLZSYBChReODrQuBk9QuWBeh00Fd5T5D4RRM8k5PIPlSCy1ahJ6MzwwwTHwV
         ekdq6dckEE9JFYkCUaEYcE2RouOFtJJWXle79kdJP3/nDnpKMhg4+D3Prbqy04kU4nzj
         qtyidDuqlcmYcfQzDVM2KMIzVGLhRqGxD8Yp9Aeq+B5SHbIvi2TNH6wCHTRHG0kRHb3d
         eKA9J7k7m0hlBGHClhTGBs6iqJgR9BSFXd2R9nIu9HKtk8g7uT2Mmphq+HWa6QOjuQ+0
         no+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223233; x=1793828033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=qwywJJrTyhkgCof3RW3CPvKY0QJAYTTtM6046AKfgupVfztW2jmMhWqLQoiDgUzDG1
         5beY/zNvE7i8a0wtokTwHErrBa1ktw8zSj8TELaDysCayhqlWiYtr2dFt0cDY7KQnVo0
         KjkyOx/9uxqspLEvlec62BTlrLHSVvqUlmzGaonRkAXj3YsckgEqMBay8NyH/eK9pHuE
         hlyMplEGIfw0hq/A19d9RcQp6n/81jKkol3DQn1MYszurlup1bWqZrFKu4pM0w5ql/Xh
         b0NRBMJKWL1a5njxsFS7eR8C66GtSWEgAcqhwn/G2hyRx7A1PWUP8PsE/ChswEaEeIBR
         RrPA==
X-Forwarded-Encrypted: i=1; AKwUvBxQW7mxtYMhG5FSMi/4LmEqkZcRYGWJeFReV69HvTixw4L4wX7WkiIvkGXr/c1Bd1arnbErPZlNqng2vcwX@vger.kernel.org
X-Gm-Message-State: AFq9FYI80K2ap3ujsA0AYfP5lRnC2czJkmUE2r9yQ7W891tkImWEYLfU
	dsdjUkIxaRBhZR0U8Li9HO4USFJVlj0ftpuAXVd7yeN0WIo2KKbm5pcILiTZuO4joeP2S4h0qKo
	E5PJ2bnkF1YoummQJTwATpZ0wtjz+xwbyXiNhGYKF8m8wYwiDqXc/nD3du8q865jUxgTe
X-Gm-Gg: AYBFou38rFkJekgRFot1NkfkMWX2r4/86Ty4xi4q2HDLcNl1tduBuZsTxlhzG7Gj1nh
	J3aHkA9NRALwlV+FgGni+44Oc+g8iXXxficChEIaDTgrE+2hnKlNIOOzJoACAMAQQLxBIjsNB9B
	VoThGdcFZ9sbiuf5bh4nCB2/mBmT808tpccrm9JaWJXUf3WbE+SBB9Ne5MQCTXdBmMiHZ4mmy6N
	HPxRSfGfgyhUcVhpwBgYPgX0X7cUtBpzmwVxTI9HNILv/opGsBhP6TbQORYPiO4OiqYYMLEWRU2
	TwI+ECEXo6cSoE3XL4I7OxtWyi+tCpgpy4FTs6WZEp+6hUY3G/17X7h6sE8D675BzDv80HKx80c
	QX//5AxOrFzP7ibUdMjRJSnTwMdVKxzG885qirkn2MNuYfOxJUOFg+eCjPjRVKLdAqAvghBj/XG
	UpBZdWWJMjyRrM/Lkn23e/KQ0=
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858511eec.40.1793223233001;
        Wed, 28 Oct 2026 14:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858476eec.40.1793223232400;
        Wed, 28 Oct 2026 14:33:52 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm9672541eec.5.2026.10.28.14.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:33:51 -0700 (PDT)
Message-ID: <436a2d4e-9297-4bbf-a305-5f6913e83aaf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:33:50 -0600
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: ep: cancel reset work during controller
 teardown
To: Jiale Yao <yaojiale02@163.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfX+nBoTd5NZ/L/
 NvomcugIobh4oREUQNeAHkZ3fVtqxn9nrNs/a/pnfUIy7TjwXUlw6x30L/LvPvj4ZdYxosr6wnO
 mgS0MO/6IPFtfUWhuXBPc5xE26+9wonjXxJSZtBaCs66T6EbLWuG6m1H9xw7965SuETgB1QX19+
 auSk92jbCricN6r7KRYWunJ7NTeBCvZWz8li6LRq0YiL4+YP5c+qBOGN+hJ/upw1R9CKObDw5QO
 IvA9g2WYkKLyf4wpRjwHy+PTMjWJEbNxouVDoSHNCgxQabWbor0wND7rJe0mNTIm8VXeDGQJR7i
 ketHnh2v6eayIEw9KtE2oE/truVIdal7xr+Y6ao2h1YRUs9dAcDCb4okoaPALTVjibOX85mIWi9
 CFyUBNuHtZcaAjR0ECTs8fFCI5eB10wS6yGF3AqhpDQjv9HKGWheA9Cz44VZO+F72gq1i+9oNPs
 mJWsXLQKIhQgtsWavtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfX/FFf7WUmOVEt
 cJmBUSrs8EPi9Fz39Sgpk1XGA0kPfUjmbrTMNOhD30yOEr8X/VZJ1rhxj9ujdDbyGIUHGiNKULR
 4OrBhKtuaB37pheTrm42hsHS/9gwiGk=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae26a41 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=AskSUVmIeMB2-BZEYoQA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rDTAPu0Xiufta_DJtqBR3ur5x2EdzVAM
X-Proofpoint-ORIG-GUID: rDTAPu0Xiufta_DJtqBR3ur5x2EdzVAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280085

On 10/21/2026 5:04 AM, Jiale Yao wrote:
> The doorbell IRQ schedules reset_work on the system workqueue when the
> host requests an MHI reset. The controller teardown only drains the
> private MHI workqueue before releasing the controller state, so
> reset_work can still run after that state has been freed.
> 
> Cancel reset_work before destroying the private workqueue and releasing
> the controller resources. The caller is required to power down the
> controller first, so the IRQ can no longer queue the work at this point.
> 
> The issue was found by static analysis. The fix was tested with an
> out-of-tree module that registers a real mhi_ep_cntrl backed by a
> software IRQ and a fake register file. The module drives mhi_ep_irq()
> and mhi_ep_unregister_controller(), and delays the reset worker until
> after the controller state has been freed. Without this fix, KASAN
> reports a slab-use-after-free in mhi_ep_ring_init() from
> mhi_ep_reset_worker. With this fix applied, controller teardown waits
> for the reset worker and the KASAN report is no longer reproduced.
> 
> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
