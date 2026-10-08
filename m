Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A2B429CC2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500178; cv=none; b=RgejZRi0N7nRkjsN4KE16DpnY1UOg1C93/gxa2VPeRnCxp1fERREqptVhGwpKeEqRhLPGPQnooLFp9DDkCjUgxUj5DZT4n4T5Nvj9rV4a/GN98ONHMj7RaPJVlSZLcYG2QrqsObRflOKSDFyh4uyPKjqN2iIWdsb/TpAtngAvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500178; c=relaxed/simple;
	bh=UeprysSFUyVE4ZYPJKXJLTjE00xRDklP/Q4e0L7Tt7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il/xYWPyE/Z5g3NwdnmRnxnGcvdfwkPI/fgKNTn9JiBXttcsqX5cOyybOATUCmMIKldjoYE6/AnvEsdtOaGVL5BTH35llrhzA2wYnIDshQ0MkxR9ggrBOQfkRYU7tvPAblyOMHkjGhcbAnzPTyv+S4sggNA4fQFYWfsqubKH5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjcnveP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I03x3jaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjcnveP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I03x3jaO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxpJK3151554
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=; b=VjcnveP7FcU+lCYS
	Ba/x4qVGtl4f31sLb2fJW9V93vtlaj1jvzXL0GZ60xmRCglZHFQWydv+f95h84j/
	h0fSeuKGvt3SdUE1GRItOYaLsRjsiUrvbdBSn7yOVT7WIl9Ck2vCeK39JV/fmhgk
	f6A1PDe4cvLV97WX9v6QYldbSRF8LkehVPwDZw7QOV7uIMTOQcVL2qgFjEHmr/Ze
	GtH8y9R1W2D6VqBck9isC7qpTqpsQCeICJcUJKoJWg4UeTl3Yq7JBlhFhh3NiBDi
	OeX4nAfMv3Npv+E2OuZNmBKoDPj5E0JhZydE/n/N878MUKtq3oDL8ClFO6E0rOnk
	JMyvDg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk0y2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 22:56:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so4534277a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791500174; x=1792104974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=I03x3jaObcrrTFsyISzVHauh34wLJe2tIzcpICXz9lu0PUsqN3HSu0AgjOZ7pw5G1w
         sjIfOYIZDYRZnMcktiifbsfkZe7oSfTX+eqp7YC9c4a0WMu5jUC+cgD/9wyy52s1+oC8
         sCOe1gn1KDLoOA9CDZdbXy+D1USVEBiiJYU6P0EewARSU091MvCLx6oueyo7AAcdhK0a
         oHWod0/NXTdprQvNRcgVoEleNDX1r2OFX48tWQlu8yTaMowqnNmQ3LZt6vjFor/bFQkk
         6ljjlP72eYHzVZpe3KXPXeph8qtX+WCjNp0hIiXrzhabuxQNHqjxauRyoaXgRXLZsgW+
         jcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500174; x=1792104974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=Be6BLfMLdWTT75OfefjkqN0U6d2/jQkIClVvi5Y6XTpYGdA3jI+0ute858WyayA1Ar
         6wKLw1B9SfSh/RjUZP5TV5CW8CiHtDHLbknKjUS7NR8o2i/ZfvZOnxmf/fFzYfrS1ASa
         foFj3xaYESRR/QUOSKOIk1GWJ7cZQTLpFhkB855A1YvUXo0XZqaNxQgNgDenV6CNsc9T
         NKDrQ1E/Zg4DMTk0K9OOC3sSQ3dlNCOW//m2wZ0qRcaTUpJuUwdbT64jOE6cxo4WLE6E
         tIfoUEqzsxzZ64qe8TwXvAz39Rw4sTGZ4BGfnFkueqJjiK0YcTzNSAw8y+K08DlXTTDl
         2vaA==
X-Forwarded-Encrypted: i=1; AKwUvBxJSjkpwqzepOxC5YBsRK6RGngPJIbSAIUUm5MdSDZgmv5eOr7+7EvcknwaYNzGo6/2i62lOhpcfXCiMu/m@vger.kernel.org
X-Gm-Message-State: AFq9FYJNkLf6acuPjNpiy265qlpnzJkEIVCFtHn4k1f5cuaM2tTzG5vx
	xrQ8tbZaNcSe1yY2eyr9WKsZzJckLXqQ4LQOfhqXj8CGw5ndtGHm+vNMup8zR5dlpRnJGksobDV
	9MGlUYZorLT6FN1tFPSMIxIW9dXu4f/00ukTL/1DSnk5XfkhYRyGoAbawDKVr8YDotxY=
X-Gm-Gg: AYBFou3dnsqY0lf0nFOhx1aF5QaqcgcH1XXmQBJcBLRpSdiYQB00enHG3JNz/AAtAlp
	eoIONQ8TlrrbRIwB9RaItqmefcScx7Iq8qLeNFgWBKIBg2cMIwxvVWsS4KVf63xdHEQ25Wr1uGQ
	dMRQnFLfVWWjMfJlc4DZu2FFCXsxVei9ofjbHNxtvPwV6JpqQCzbCXr0SQ3iryws7tjBRhWR0Sq
	EHVAEF0Goo6a/Nchjwh+qhmASweiwAfDYCykbdhWPOw9KiS+J0AvvRf0RkQC9TYGbLX1KRo0d6a
	B5b2isEADldz5GBaGotdJnDoP7rXffyymJmOsTBQriGU0TSih4VZnpkroENuRIoYnvgg5+jqdW1
	yhMSPDH+JsC0x1p6kH95vv6R0u7Kd4N5G
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217292a91.51.1791500174368;
        Thu, 08 Oct 2026 15:56:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217285a91.51.1791500173870;
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm549161a91.7.2026.10.08.15.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Message-ID: <f5682a0f-a0bf-46f2-a238-faeb1333c071@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:04 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac81f8f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: KHC-uPRjchBvcSW6dMG62XkltwG8c-JT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfXzpi5wmwaKpNJ
 A9jMAfrimJp0vJpPo7NcZW16GFm6X0JoVBFOCzJPx5EEpnFxyw0wBNAUqSdqb8sa3El05nB+be+
 eApQtLw0yeYM6dL09fJbHsJeOWjg1J8=
X-Proofpoint-ORIG-GUID: KHC-uPRjchBvcSW6dMG62XkltwG8c-JT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfXwo/TJCrn7GZH
 Gx4UfDCglyir2/UBFSJXcMOlD364B9p0QR8CTJS0fgjuXO4S5UBfcDUCIIZ1DpPZ4LeKW270kNb
 aiVOWdL2n3kDSsy68z5c9kjztqZTDT/F7rd01YMLNER3ncf3LMZr1wmIpBayQPRkwD8VN2VcpDm
 AIY4plcMOKz1g5Q+iS6s/vYwowPZaUVhl3qYOFZtDada98Zk0EL3dsZvjfs/ROvtEZsxQAYMTpK
 1DGGAnOtKngMedje6nzqY3KNKnQpJL51Xef1KlO7qsZDovYNJhVpYGgxcP8xgL0LXxsEomN3Jjt
 wFxzLWKolUD7YOiHFx8OCYvlWZJMxxLC5ZR0x/Rh1u7vah8l3KCNus7lgvBpWVzAjcpiY9FmfqG
 oQG7TTTQYPQcD3E06Tx60R2FK7IiQZE+oZkEa0AOjJt84Ow+b4lPnA3OnqMKTPc2ZrA8z7aU+Fv
 y2O9/UyCozlYskdXzDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080091

Hi Jens,

On 10/8/2026 7:11 PM, Jens Wiklander wrote:
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> OP-TEE commands can span multiple exchanges with normal world. A call
>> may yield to request an RPC service or allow interrupt processing
>> before continuing execution in secure world.
>>
>> Add the RPMI yielding-call path used by the common OP-TEE session
>> operations. Submit the command and RPC argument buffers as ranges
>> within a shared memory parcel.
>>
>> Handle RPC requests while the call is suspended and resume execution
>> using the token returned by OP-TEE until the command completes.
>>
>> Use the common OP-TEE call queue to wait when an initial request is
>> rejected with RPMI_ERR_BUSY, allowing another active call to complete
>> before retrying.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 124 insertions(+)
>>
>> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
>> index 58d82678be98..6e76316794c1 100644
>> --- a/drivers/tee/optee/rpmi_abi.c
>> +++ b/drivers/tee/optee/rpmi_abi.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mailbox/riscv-rpmi-message.h>
>>  #include <linux/overflow.h>
>>  #include <linux/rpmi_tee.h>
>> +#include <linux/sched.h>
>>  #include <linux/slab.h>
>>  #include <linux/unaligned.h>
>>  #include "optee_private.h"
>> @@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
>>                 optee_rpc_cmd(ctx, optee, arg);
>>         }
>>  }
>> +
>> +/* Handle RPC command or interrupt returns from a yielding call. */
>> +static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
>> +                                 u32 result, struct optee_msg_arg *arg)
>> +{
>> +       switch (result) {
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
>> +               optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
>> +               break;
>> +       case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
>> +               break;
>> +       default:
>> +               pr_warn("Unknown RPC func 0x%x\n", result);
>> +               break;
>> +       }
>> +}
>> +
>> +/**
>> + * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
>> + * @ctx: calling context
>> + * @req: initial command request
>> + * @rpc_arg: shared RPC argument buffer
>> + * @system_thread: caller requests TEE system thread support
>> + *
>> + * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
>> + *
>> + * Return: zero on completion, or a negative error.
>> + */
>> +static int optee_rpmi_yielding_call(struct tee_context *ctx,
>> +                                   const struct optee_rpmi_call_req *req,
>> +                                   struct optee_msg_arg *rpc_arg,
>> +                                   bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_rpmi_resume_req resume = {
>> +               .op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
>> +               /* resume_token is nonzero after OP-TEE suspends the call. */
>> +               .resume_token = 0,
> 
> I missed this when reviewing "tee: optee: define the RPMI control and
> parcel-reference ABI". I'd prefer if the resume_token was a truly
> opaque value, just as for the SMC and FF-A ABIs. Any reason why it's a
> 64-bit value instead of 32-bit, as is used for the other ABI?
> 

Agreed. I currently use a zero token to distinguish the initial request
from a resume. I'll track that separately with a boolean and treat the token
as opaque, only copying it from the response into the resume request.

There is no specific reason for it to be 64-bit; I overlooked the
existing ABI convention. I'll change it to 32-bit.

>> +       };
>> +       struct optee_rpmi_call_resp resp;
>> +       struct optee_call_waiter waiter;
>> +       u32 result;
>> +       s32 status;
>> +       int ret;
>> +
>> +       optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
>> +       while (true) {
>> +               if (resume.resume_token)
>> +                       ret = optee_rpmi_call_with_status(optee, &resume,
>> +                                                         sizeof(resume), &resp,
>> +                                                         sizeof(resp), &status);
>> +               else
>> +                       ret = optee_rpmi_call_with_status(optee, req, sizeof(*req),
>> +                                                         &resp, sizeof(resp),
>> +                                                         &status);
> 
> Please fix the too-long lines above.
> 

Ack.

>> +               if (ret)
>> +                       goto done;
>> +
>> +               switch (status) {
>> +               case RPMI_SUCCESS:
> 
> Any particular reason why we aren't using TEE error codes here?
> 

I defined RPMI error codes consistently for all control responses in optee_rpmi.h.
However, these statuses belong to the OP-TEE service ABI rather than the transport.
I'll change them to TEE error codes and keep RPMI errors at the transport layer.

>> +                       break;
>> +               case RPMI_ERR_BUSY:
>> +                       if (!resume.resume_token) {
>> +                               optee_cq_wait_for_completion(&optee->call_queue,
>> +                                                            &waiter);
>> +                               continue;
>> +                       }
>> +
>> +                       fallthrough;
>> +               default:
>> +                       ret = rpmi_to_linux_error(status);
>> +                       goto done;
>> +               }
>> +
>> +               result = get_unaligned_le32(&resp.result);
> 
> Why not le32_to_cpu(resp.result)?

You are right, there are a couple of more of this that I missed.
I'll fix all in the next version.

Thanks Jens for the review.

Best Regards,
Amir

> 
> Cheers,
> Jens
> 
>> +               if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
>> +                       goto done;
>> +
>> +               cond_resched();
>> +               optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
>> +
>> +               resume.resume_token = resp.resume_token;
>> +       }
>> +done:
>> +       optee_cq_wait_final(&optee->call_queue, &waiter);
>> +
>> +       return ret;
>> +}
>> +
>> +/* The caller supplies SHM with room for command and RPC args. */
>> +static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
>> +                                      struct tee_shm *shm, u_int offs,
>> +                                      bool system_thread)
>> +{
>> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
>> +       struct optee_msg_arg *arg, *rpc_arg;
>> +       struct optee_rpmi_call_req req;
>> +       size_t arg_size, rpc_size, rpc_offset;
>> +       u32 parcel_id, nonce;
>> +
>> +       arg = tee_shm_get_va(shm, offs);
>> +       if (IS_ERR(arg))
>> +               return PTR_ERR(arg);
>> +
>> +       arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
>> +       rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
>> +       rpc_offset = offs + arg_size;
>> +       rpc_arg = tee_shm_get_va(shm, rpc_offset);
>> +       if (IS_ERR(rpc_arg))
>> +               return PTR_ERR(rpc_arg);
>> +
>> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
>> +
>> +       req.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
>> +       req.parcel_id = cpu_to_le32(parcel_id);
>> +       req.nonce = cpu_to_le32(nonce);
>> +       req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
>> +       req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
>> +       req.arg_size = cpu_to_le32(arg_size);
>> +       req.rpc_size = cpu_to_le32(rpc_size);
>> +
>> +       return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
>> +}
>>
>> --
>> 2.34.1
>>

