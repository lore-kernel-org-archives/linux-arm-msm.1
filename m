Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA63BE16A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917785; cv=none; b=hklN71IVNrwfFyyR5orYcKhRuStV80AFM5NqcJvqNRDN4JZmo1sTh7sa7zsIUxXhg6oyt+AbuQM1971HG2AYN0roua81FE7L5A5bhUeQU28SwN8RDkFxbuRbjk2Y2ikMR/qcIX1JymzN1ByOdlaQ//ewPw6sDlzmg5z2aEflW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917785; c=relaxed/simple;
	bh=+/rOEJj81OEoAsYzQmF4HZC9WBJAzqVNU2+FK5VdYas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HejaVtkFV1UYdeMqbimAd1wo97nMeU53R5iq+AYsM5Ef1DQczOIvh8vZ/UuSbOBpKA9pCanYFZWv1b7NBWZUwsTWszdJeU0dLTvWlLeqqNO2cdFvsjlq9QnFMdigBkkHzkQte13BzrYs5V1tllRHe5nHBxQdyyhPOdkVvgHAtYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyfNmFNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcIZTeCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyfNmFNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcIZTeCb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHQNjQ1592103
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=; b=LyfNmFNMtY8X499b
	2LyB1tCvlZ8nclC5N7sgYScrqzUIsLNu3+SFUC3pZsurc51YQrZiSVpHkxj5EYFN
	qkuIxvjobU9LZtXEkmWEGvI1mlaDFL1L4iXudWdwHiwSj36z3EVTGzE0wrRxtEam
	fa8mdjUavJv/yl7SUgduojWx8kWcWVPMkQRjJVhLmKY5H3MEnZzWVTD9OXWY6TLu
	bcCA+9WieeZwOIeZtStqWQPK4EO2cIiDjOBlb+03D7M2zb51JEHEv1t146UDRf9y
	gw95ob1mJyLZdufBgK/hHD0LivQu0YJ71JovqpY9U2cY0uWjBIvkka87OFaGJG55
	Fuw8fA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tgeuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:56:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so2068883eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917781; x=1792522581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=;
        b=GcIZTeCb7Zphb3pHO2jx0AP6OGhx9/zLl2kV8K8or58hUI4MKhUdfcVhgIU4O3u/aS
         +R2lUqaj/H9kcKDnoEfwAIK90ScNwj89UtIJ0kcfeRGi+sLFkEYE4/EWlKlZHVK4yAsV
         iW4HoqkACTimbLUHntaWzuoZJIXeqvXaAhUJw8VWafomb0YXXcuFa+37PWrWG0x4Hbxv
         QpDOBi3F5FRTCgYOvHUbB4U58uLpgRtH8afaOhtXa2uJEDLHg+4nnsZ/s0tbEjWWuJFu
         3PjzJiWTbkE9bqlR3x/6pMortmbH2FYTl+mDeGvg8DdUgjJsb+jNx6S8Ii3XMTLZ+tHh
         fBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917781; x=1792522581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=;
        b=S9woCAN+nH/p2gcTDAHZHUEqNAKnIVSqDFu7gDjADvpDrfQJjqftu/AbgRm27ThwFP
         OrucTUPUwAbC27sZ92fU7V13SRDoBkEYtOOn772CPe/hx1g96W82QTP5uP3sEbmeVAcO
         E2wMvTRi70Ph4ipJyt+coURVhwbkCgiPqZ0Ybx0rnsutioysytSDAU5ZXJBkvagFedoU
         P+cXeMETbYZ9TmyrU5yF5TbhI6MQnIpMrI1bdb3l9RQvX6q0URS3Egc156A+fn15cqVT
         4s8sQOzi4ydwJdiT9QvCutgXdLZjrP8PnU6oOqxZknmGHuqqQcyasJLh+/A+aNpDFivs
         yHfg==
X-Gm-Message-State: AFq9FYLl/bhMhW8V817o1UA5rzSUtrPqggbnZhnJwbsLz/pelgJpiXl4
	Z/3K1GltcPfgqWMMBcVOEJm5buWW4AWyL2sPdB838yq9LXjQF0gA7eTzS0OlJdVzT8lkL81nrCR
	KiOTO7x+4iJF8Py9NukYij6Af4t35qKmeq+rJg9HARNWutBMsvEsfwv0yc7p9+oWcyD82
X-Gm-Gg: AYBFou1q1YH7XVslCMTN1brXXDlIjGQLyTG3MmFBo9ChQ6Oq2A3+MwRwh15VBDsEpmp
	c+G5qcNyDn4AJYQZK9Cj/diyF6nUbT/S/HW2wuoeRaeSezxyvPhSgce/20VwBByeAicx70aOHsy
	7Qw5mR21O5W4lDG0f4gHBbAs1+PBZV4UEwl46L8CSPVglTO+vWVc9SLGDLgFOUbWrPXpIJ2DaFC
	GGtmzmDOhs9IYxu2+gHPP38fdrCBsgbjNLHFvN8q5+7KSpRyxlMO/+Qa+72A6TKzAbjuNaHMLPr
	Klx8ZK0wc1+bviJ6DgR38TjmUSX4uka6gTfleQMK/P/rz9ru7ggJOxi8RP8KfWqKtJ92E59gPP4
	1DO79k/j4/joRjqkILr+Bu3QHxZBb2yEhX2/mR6tVDpoIkeM46g==
X-Received: by 2002:a05:7022:5f18:b0:143:298f:33b6 with SMTP id a92af1059eb24-16a6203ab5emr17121158c88.46.1791917781417;
        Tue, 13 Oct 2026 11:56:21 -0700 (PDT)
X-Received: by 2002:a05:7022:5f18:b0:143:298f:33b6 with SMTP id a92af1059eb24-16a6203ab5emr17121056c88.46.1791917779716;
        Tue, 13 Oct 2026 11:56:19 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm43594045c88.0.2026.10.13.11.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:56:19 -0700 (PDT)
Message-ID: <e6a86bf0-86bd-4010-9d95-5b87bb2a3009@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:56:14 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Protect perf stats BO state with bo->lock
To: Shuvam Pandey <shuvampandey1@gmail.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <6a115824.a0bed9bd.3c0137.9edf@mx.google.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <6a115824.a0bed9bd.3c0137.9edf@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6ace7ed6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MIdiunF4UWRBeV6dtGUA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX56StvzVLrvki
 tVJ4Hy6Sqfvwo1VsO/09+fgUBjsA0G5exRRm+mjKxWtO79bLEijmgDLLoi2/qGoNPYslNeZLzfa
 Pp4IVoJAFxwqgxNhdyfuLNADdpNGocUu1oUnPuZvntHxdlgraa6ORaAnJ9FxoV+6YqKk72d5vA1
 PqjqD/yFB6/SYS8Dc8vy6YBMvOGZrzvhM8I33ZxKLBn4Z1Jwmgw0TaqBwcS7+QQLadmNQS/XWvV
 Bh7XEBhza8aK83iu0Y/82H70l3h+AwFaHmPJxGz9Id6k4O5+l8Z1OZWwEKdpzvA72lqQT0gxg0K
 9fxclD3vh5Qc5JAWxkaKEvRx24dt18pHI/wRs1xw3+aZHJUi3Dytbif4yS0BU+TwYlFFk5Sb/UK
 hkfrJk8/Bw4GwY+IKHaJQOVqxkE0NQ7FEhybp8MXk9p7m5+hHAHdDjhltk+RWp+I39Nts+GzIrc
 AQ3wktOmI2akWjNA6lQ==
X-Proofpoint-ORIG-GUID: u09GYobwQYm12y0peyKBajIHM8v2y-dt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX9Ndx/MjJX0qH
 dGF8Vf6C4YlRGuzaaDgm4BMaoVEQdbARICJ6mFC+u3b5uF7vqKaKARObiF/cQ5EZW00aBaFhA4S
 +foFRkMk4lcnZBJXsoFSxmWAfBpWnR0=
X-Proofpoint-GUID: u09GYobwQYm12y0peyKBajIHM8v2y-dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130075

On 5/23/2026 1:32 AM, Shuvam Pandey wrote:
> qaic_perf_stats_bo_ioctl() validates each BO by checking bo->sliced and
> bo->dbc before returning its perf stats. These fields are changed by the
> detach paths while holding bo->lock, but the perf stats ioctl reads them
> without that lock.
> 
> A concurrent detach can clear bo->dbc and mark the BO unsliced while the
> perf stats ioctl is validating the BO. Take bo->lock while checking the
> BO state and copying the per-BO stats into the temporary result buffer.
> 
> Fixes: 4ddf4ddfceb4 ("accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
