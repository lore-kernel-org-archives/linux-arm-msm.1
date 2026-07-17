Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD33E16A8;
	Fri, 17 Jul 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276790; cv=none; b=i4+JuMP0o851avo42UWcfH7kRY6onSeQpBSUuu086SX/bezT8kaSNA88xzo3V7oKHw+oFEhf2I7162QB7uP/loBGpSut+jZfb8Fl7N9sKopgLvnURzbQNC2GaOw96MYftzm61JLWSlgvcG9eUktMKiJOzt77iJlKBejMU3mkQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276790; c=relaxed/simple;
	bh=1xG3YLOsPm1dkk9Z7IFE9iNcHyk1hv0jOWZy6+etZYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6HzopWww8rZYmU7zaI8RqBmxXBkEn3tKqCCiLECFngeVwzvcHsE74l6yj+9ZT01ypQdk0vByL7qekKBct3Wr86cmMLFpoklPqhNbzHRAKHOo/8Qm7tEV/UbnkvMn0kQgmMYm6olPHqih1c+JKnN8VMwJD2mK61XxcIE/S/p4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R34NPmHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R34NPmHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EB41F000E9;
	Fri, 17 Jul 2026 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276786;
	bh=LpmBS/Sv5GrzAqnUYkeMI+pAXqhFmD8OpxNOUB/WXVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R34NPmHCXyCv6GwxYfQDQDbaFeuW3xxZgvlLar++wz6OQGvPSlN2DrrUlvo2vuwrN
	 K/2kEmR7GtbCrofgJKaSqWvlOrrNRegIsMPJc53tW2Js/pY6e9489AD5LkrcCxqa7R
	 kdok6Cjl3zDzI9N6fEvNMVSZ+pVC6RAW2n2w543wA8Y1rmi31//GxAO6FCKpdqJvLK
	 DPyRJ1Rc+iPRePrXEPoeKfa/c0vOtCCqovThCf3d4cA4L1xeC+exmFHlDxzbNoef9Q
	 Xz2nzARFm2BOZShZic/BGfdNWMkS13PW/4BP+ubiDXrDlW6ag24+rc4paKR3lIWOu1
	 cn8KJUAQR7Hew==
Date: Fri, 17 Jul 2026 13:56:19 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Basant Kumar <basantk@qti.qualcomm.com>,
	Apurupa Pattapu <apurupa@qti.qualcomm.com>,
	Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, jenswi@kernel.org
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
Message-ID: <alnnK1jVntH-llsA@sumit-xelite>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
 <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
 <fb1d4954-7c0f-4609-be40-b032876169b8@oss.qualcomm.com>
 <f917eb0f-9c9d-4f30-9c4f-ac3aeddac967@oss.qualcomm.com>
 <534f6507-dd46-432b-80cd-87c17e3e0a71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <534f6507-dd46-432b-80cd-87c17e3e0a71@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 12:28:25PM +0530, Harshal Dev wrote:
> Hi Amir,
> 
> On 7/15/2026 5:17 AM, Amirreza Zarrabi wrote:
> > Hi Harshal,
> > 
> > On 7/10/2026 4:37 PM, Harshal Dev wrote:
> >> Hi Amir,
> >>
> >> On 7/8/2026 11:31 AM, Amirreza Zarrabi wrote:
> >>> Hi Harshal,
> >>>
> >>> On 7/7/2026 4:11 PM, Harshal Dev wrote:
> >>>> QCOMTEE needs to distinguish between object invocations arriving from
> >>>> kernel clients and user-space clients in order to correctly marshal
> >>>> UBUF parameters and decide whether certain operations should be permitted.
> >>>>
> >>>> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
> >>>> the context of object invocation. Objects invoked from the kernel-space
> >>>> are expected to have the MSB of their 64-bit object-id set to indicate a
> >>>> kernel context, whereas objects invoked from user-space should not set it.
> >>>> To ensure this, we restrict the object-id space of user-space invoked
> >>>> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
> >>>> ids.
> >>>>
> >>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
> >>>>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
> >>>>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
> >>>>  drivers/tee/tee_core.c               |  4 ++++
> >>>>  4 files changed, 38 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> >>>> index 0efc5646242a..a74a54d67b06 100644
> >>>> --- a/drivers/tee/qcomtee/call.c
> >>>> +++ b/drivers/tee/qcomtee/call.c
> >>>> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
> >>>>  {
> >>>>  	struct qcomtee_context_data *ctxdata = ctx->data;
> >>>>  	struct qcomtee_object *object;
> >>>> +	bool kernel_ctx = false;
> >>>>  	int i, ret, result;
> >>>>  
> >>>>  	if (qcomtee_params_check(params, arg->num_params))
> >>>>  		return -EINVAL;
> >>>>  
> >>>> +	/* Obtain the invocation context information from the MSB of the object
> >>>> +	 * `id` field.
> >>>> +	 */
> >>>> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
> >>>> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
> >>>> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
> >>>> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
> >>>> +	 * NULL object we must extend the object-id to 64-bits from here on so that
> >>>> +	 * QCOMTEE can recognize it.
> >>>> +	 */
> >>>> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
> >>>> +		arg->id = TEE_OBJREF_NULL;
> >>>
> >>> Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
> >>> Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
> >>> What do you think?
> >>
> >> I agree. Instead of checking for kernel-ctx by right shifting, I can use this approach.
> >> QTEE objects invoked from user-space (including NULL object) will always have their
> >> object-id constrained to lower 32 bits anyway as per PR: https://github.com/quic/quic-teec/pull/27
> >>
> >> And for kernel-space invoked QTEE objects, upper 32-bits would be set for NULL object,
> >> and 63rd bit expected to be set as well.
> >>
> > 
> > Re-thinking this, I'm a bit concerned about overloading id while keeping it as a u64,
> > and then filtering its upper 32 bits in tee_ioctl_object_invoke(). It feels unintuitive,
> > as it naturally raises the question: if only the lower 32 bits are meaningful,
> > why is id a `u64` in the first place?
> > 
> > What if we make the caller origin explicit instead, for example:
> > 
> > enum tee_object_invoke_origin {
> > 	TEE_OBJECT_INVOKE_USERSPACE,
> > 	TEE_OBJECT_INVOKE_KERNEL,
> > };
> > 
> > and then pass it through the backend op:
> > 
> > int (*object_invoke_func)(struct tee_context *ctx,
> > 			  struct tee_ioctl_object_invoke_arg *arg,
> > 			  struct tee_param *param,
> > 			  enum tee_object_invoke_origin origin);
> > 
> > It seems more straightforward and avoids encoding caller-origin metadata into id.
> > If you are OK, let's do this.
> >
> 
> Honestly, this approach makes everything a lot more easier, since we don't need complex
> bit manipulation in back-end to filter the upper 32 bits and handle the case of
> TEE_OBJREF_NULL. I can also then drop the PR: https://github.com/quic/quic-teec/pull/27
> 
> I am fine with updating this callback and calling it with TEE_OBJECT_INVOKE_USERSPACE from
> https://elixir.bootlin.com/linux/v7.1/source/drivers/tee/tee_core.c#L704
> and TEE_OBJECT_INVOKE_KERNEL from the newly introduced tee_client_object_invoke_func().
> 
> But is there any special reason for choosing an enum over a boolean value here? Are we planning
> to extend the enum later to introduce any other context information?

I think enum is just better to provide enough info for the flag.

> 
> I am fine with this approach. I hope the OP-TEE maintainers @Sumit are fine as well with the
> new parameter addition in the callback.

That's fine with me if it simplifies the object handling for you folks.

-Sumit
